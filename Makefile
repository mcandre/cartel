all: test

cartel-debian-x86_64: debian-x86_64.Dockerfile
	docker build -t mcandre/cartel:debian-x86_64 -f debian-x86_64.Dockerfile .

cartel-debian-other: debian-other.Dockerfile
	docker build -t mcandre/cartel:debian-other -f debian-other.Dockerfile .

cartel-alpine-x86_64: alpine-x86_64.Dockerfile
	docker build -t mcandre/cartel:alpine-x86_64 -f alpine-x86_64.Dockerfile .

cartel-cloudabi: cloudabi.Dockerfile setup-cloudabi.debian.sh
	docker build -t mcandre/cartel:cloudabi -f cloudabi.Dockerfile .

test-debian-x86: cartel-debian-x86_64 example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -m32 -o bin/hello hello.c && ./bin/hello\""

test-debian-x86_64: cartel-debian-x86_64 example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -o bin/hello hello.c && ./bin/hello\""

test-debian-x32: cartel-debian-x86_64 example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -mx32 -o bin/hello hello.c\""

test-debian-armel: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && arm-linux-gnueabi-gcc -o bin/hello hello.c\""

test-debian-armhf: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && arm-linux-gnueabihf-gcc -o bin/hello hello.c\""

test-debian-aarch64: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && aarch64-linux-gnu-gcc -o bin/hello hello.c\""

test-generic-armel: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && arm-none-eabi-gcc -o bin/hello -specs=nano.specs -specs=nosys.specs hello.c\""

test-debian-alpha: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && alpha-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-m68k: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && m68k-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-mips: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && mips-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-mipsel: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && mipsel-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-mips64: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && mips64-linux-gnuabi64-gcc -o bin/hello hello.c\""

test-debian-mips64el: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && mips64el-linux-gnuabi64-gcc -o bin/hello hello.c\""

test-debian-ppc: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && powerpc-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-ppcspe: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && powerpc-linux-gnuspe-gcc -o bin/hello hello.c\""

test-debian-ppc64: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && powerpc64-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-ppc64le: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && powerpc64le-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-riscv64: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && riscv64-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-s390x: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && s390x-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-sh4: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && sh4-linux-gnu-gcc -o bin/hello hello.c\""

test-debian-sparc64: cartel-debian-other example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:debian-other sh -c \"cd /src && mkdir -p bin && sparc64-linux-gnu-gcc -o bin/hello hello.c\""

test-alpine-x86_64: cartel-alpine-x86_64 example/hello.c
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:alpine-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -o bin/hello hello.c && ./bin/hello\""

test-cloudabi-x86_64: cartel-cloudabi example/hello.c example/cloudabi.yml
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:cloudabi sh -c \"cd /src && mkdir -p bin && x86_64-unknown-cloudabi-cc -o bin/hello hello.c && cloudabi-run -e bin/hello <cloudabi.yml\""

test: test-debian-x86 test-debian-x86_64 test-debian-x32 test-debian-armel test-debian-armhf test-generic-armel test-debian-alpha test-debian-m68k test-debian-mips test-debian-mipsel test-debian-mips64 test-debian-mips64el test-debian-ppc test-debian-ppcspe test-debian-ppc64 test-debian-ppc64le test-debian-riscv64 test-debian-s390x test-debian-sparc64 test-alpine-x86_64 test-cloudabi-x86_64

publish-debian-x86_64: cartel-debian-x86_64
	docker push mcandre/cartel:debian-x86_64

publish-debian-other: cartel-debian-other
	docker push mcandre/cartel:debian-other

publish-alpine-x86_64: cartel-alpine-x86_64
	docker push mcandre/cartel:alpine-x86_64

publish-cloudabi: cartel-cloudabi
	docker push mcandre/cartel:cloudabi

publish: publish-debian-x86_64 publish-debian-other publish-alpine-x86_64 publish-cloudabi

clean:
	-rm -rf example/bin
