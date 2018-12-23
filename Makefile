all: test

cartel-linux-x86: linux-x86.Dockerfile
	docker build -t mcandre/cartel:linux-x86 -f linux-x86.Dockerfile .

cartel-linux-x86_64: linux-x86_64.Dockerfile
	docker build -t mcandre/cartel:linux-x86_64 -f linux-x86_64.Dockerfile .

cartel-linux-arm: linux-arm.Dockerfile
	docker build -t mcandre/cartel:linux-arm -f linux-arm.Dockerfile .

cartel-cloudabi: cloudabi.Dockerfile setup-cloudabi.ubuntu.sh
	docker build -t mcandre/cartel:cloudabi -f cloudabi.Dockerfile .

test-linux-x86: cartel-linux-x86
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-x86 sh -c \"cd /src && mkdir -p bin && gcc -m32 -o bin/hello hello.c && ./bin/hello\""

test-linux-x86_64: cartel-linux-x86_64
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-x86_64 sh -c \"cd /src && mkdir -p bin && gcc -o bin/hello hello.c && ./bin/hello\""

test-linux-arm: cartel-linux-arm
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:linux-arm sh -c \"cd /src && mkdir -p bin && arm-linux-gnueabi-gcc -o bin/hello hello.c\""

test-cloudabi: cartel-cloudabi
	sh -c "cd example && docker run --rm -v \"\$$(pwd):/src\" mcandre/cartel:cloudabi sh -c \"cd /src && mkdir -p bin && x86_64-unknown-cloudabi-cc -o bin/hello hello.c && cloudabi-run bin/hello\""

test: test-linux-x86 test-linux-x86_64 test-linux-arm test-cloudabi

publish-linux-x86: cartel-linux-x86
	docker push mcandre/cartel:linux-x86

publish-linux-x86_64: cartel-linux-x86_64
	docker push mcandre/cartel:linux-x86_64

publish-linux-arm: cartel-linux-arm
	docker push mcandre/cartel:linux-arm

publish-cloudabi: cartel-cloudabi
	docker push mcandre/cartel:cloudabi

publish: publish-linux-x86 publish-linux-x86_64 publish-linux-arm publish-cloudabi

clean:
	-rm -rf example/bin
