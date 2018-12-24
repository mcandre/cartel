all: test

cartel-linux-x86: linux-x86.Dockerfile
	docker build -t mcandre/cartel:linux-x86 -f linux-x86.Dockerfile .

cartel-linux-x86_64: linux-x86_64.Dockerfile
	docker build -t mcandre/cartel:linux-x86_64 -f linux-x86_64.Dockerfile .

cartel-linux-arm: linux-arm.Dockerfile
	docker build -t mcandre/cartel:linux-arm -f linux-arm.Dockerfile .

cartel-linux-alpha: linux-alpha.Dockerfile
	docker build -t mcandre/cartel:linux-alpha -f linux-alpha.Dockerfile .

cartel-linux-m68k: linux-m68k.Dockerfile
	docker build -t mcandre/cartel:linux-m68k -f linux-m68k.Dockerfile .

cartel-linux-mips: linux-mips.Dockerfile
	docker build -t mcandre/cartel:linux-mips -f linux-mips.Dockerfile .

cartel-cloudabi: cloudabi.Dockerfile setup-cloudabi.ubuntu.sh
	docker build -t mcandre/cartel:cloudabi -f cloudabi.Dockerfile .

test-linux-x86: cartel-linux-x86
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-x86 sh -c \"cd /src && mkdir -p bin && gcc -m32 -o bin/hello hello.c && ./bin/hello\""

test-linux-x86_64: cartel-linux-x86_64
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -o bin/hello hello.c && ./bin/hello\""

test-linux-armel: cartel-linux-arm
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-arm sh -c \"cd /src && mkdir -p bin && arm-linux-gnueabi-gcc -o bin/hello hello.c\""

test-linux-armhf: cartel-linux-arm
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-arm sh -c \"cd /src && mkdir -p bin && arm-linux-gnueabihf-gcc -o bin/hello hello.c\""

test-linux-aarch64: cartel-linux-arm
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-arm sh -c \"cd /src && mkdir -p bin && aarch64-linux-gnu-gcc -o bin/hello hello.c\""

test-generic-armel: cartel-linux-arm
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-arm sh -c \"cd /src && mkdir -p bin && arm-none-eabi-gcc -o bin/hello -specs=nano.specs -specs=nosys.specs hello.c\""

test-linux-alpha: cartel-linux-alpha
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-alpha sh -c \"cd /src && mkdir -p bin && alpha-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-m68k: cartel-linux-m68k
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-m68k sh -c \"cd /src && mkdir -p bin && m68k-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-mips: cartel-linux-mips
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-mips sh -c \"cd /src && mkdir -p bin && mips-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-mipsel: cartel-linux-mips
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-mips sh -c \"cd /src && mkdir -p bin && mipsel-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-mips64: cartel-linux-mips
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-mips sh -c \"cd /src && mkdir -p bin && mips64-linux-gnuabi64-gcc -o bin/hello hello.c\""

test-linux-mips64el: cartel-linux-mips
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-mips sh -c \"cd /src && mkdir -p bin && mips64el-linux-gnuabi64-gcc -o bin/hello hello.c\""

test-cloudabi-x86_64: cartel-cloudabi example/cloudabi-stdout.yml
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:cloudabi sh -c \"cd /src && mkdir -p bin && x86_64-unknown-cloudabi-cc -o bin/hello hello.c && cloudabi-run -e bin/hello <cloudabi-stdout.yml\""

test: test-linux-x86 test-linux-x86_64 test-linux-armel test-linux-armhf test-generic-armel test-linux-alpha test-linux-m68k test-linux-mips test-linux-mipsel test-linux-mips64 test-linux-mips64el test-cloudabi-x86_64

publish-linux-x86: cartel-linux-x86
	docker push mcandre/cartel:linux-x86

publish-linux-x86_64: cartel-linux-x86_64
	docker push mcandre/cartel:linux-x86_64

publish-linux-arm: cartel-linux-arm
	docker push mcandre/cartel:linux-arm

publish-linux-alpha: cartel-linux-alpha
	docker push mcandre/cartel:linux-alpha

publish-linux-m68k: cartel-linux-m68k
	docker push mcandre/cartel:linux-m68k

publish-linux-mips: cartel-linux-mips
	docker push mcandre/cartel:linux-mips

publish-cloudabi: cartel-cloudabi
	docker push mcandre/cartel:cloudabi

publish: publish-linux-x86 publish-linux-x86_64 publish-linux-arm publish-linux-alpha publish-linux-m68k publish-linux-mips publish-cloudabi

clean:
	-rm -rf example/bin
