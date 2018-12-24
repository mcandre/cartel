all: test

cartel-linux-x86_64: linux-x86_64.Dockerfile
	docker build -t mcandre/cartel:linux-x86_64 -f linux-x86_64.Dockerfile .

cartel-linux-other: linux-other.Dockerfile
	docker build -t mcandre/cartel:linux-other -f linux-other.Dockerfile .

cartel-cloudabi: cloudabi.Dockerfile setup-cloudabi.debian.sh
	docker build -t mcandre/cartel:cloudabi -f cloudabi.Dockerfile .

test-linux-x86: cartel-linux-x86_64
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -m32 -o bin/hello hello.c && ./bin/hello\""

test-linux-x86_64: cartel-linux-x86_64
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -o bin/hello hello.c && ./bin/hello\""

test-linux-x32: cartel-linux-x86_64
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -mx32 -o bin/hello hello.c\""

test-linux-armel: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && arm-linux-gnueabi-gcc -o bin/hello hello.c\""

test-linux-armhf: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && arm-linux-gnueabihf-gcc -o bin/hello hello.c\""

test-linux-aarch64: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && aarch64-linux-gnu-gcc -o bin/hello hello.c\""

test-generic-armel: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && arm-none-eabi-gcc -o bin/hello -specs=nano.specs -specs=nosys.specs hello.c\""

test-linux-alpha: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && alpha-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-m68k: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && m68k-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-mips: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && mips-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-mipsel: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && mipsel-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-mips64: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && mips64-linux-gnuabi64-gcc -o bin/hello hello.c\""

test-linux-mips64el: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && mips64el-linux-gnuabi64-gcc -o bin/hello hello.c\""

test-linux-ppc: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && powerpc-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-ppcspe: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && powerpc-linux-gnuspe-gcc -o bin/hello hello.c\""

test-linux-ppc64: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && powerpc64-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-ppc64le: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && powerpc64le-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-riscv64: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && riscv64-linux-gnu-gcc -o bin/hello hello.c\""

test-linux-s390x: cartel-linux-other
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-other sh -c \"cd /src && mkdir -p bin && s390x-linux-gnu-gcc -o bin/hello hello.c\""

test-cloudabi-x86_64: cartel-cloudabi example/cloudabi-stdout.yml
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:cloudabi sh -c \"cd /src && mkdir -p bin && x86_64-unknown-cloudabi-cc -o bin/hello hello.c && cloudabi-run -e bin/hello <cloudabi-stdout.yml\""

test: test-linux-x86 test-linux-x86_64 test-linux-x32 test-linux-armel test-linux-armhf test-generic-armel test-linux-alpha test-linux-m68k test-linux-mips test-linux-mipsel test-linux-mips64 test-linux-mips64el test-linux-ppc test-linux-ppcspe test-linux-ppc64 test-linux-ppc64le test-linux-riscv64 test-linux-s390x test-cloudabi-x86_64

publish-linux-x86_64: cartel-linux-x86_64
	docker push mcandre/cartel:linux-x86_64

publish-linux-other: cartel-linux-other
	docker push mcandre/cartel:linux-other

publish-cloudabi: cartel-cloudabi
	docker push mcandre/cartel:cloudabi

publish: publish-linux-x86_64 publish-linux-other publish-cloudabi

clean:
	-rm -rf example/bin
