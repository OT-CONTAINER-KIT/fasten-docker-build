problem-build-package:
	DOCKER_BUILDKIT=1
	docker build -t opstree/fasten-build -f Dockerfile.problem .

problem-build-package-with-time:
	time make problem-build-package >/dev/null 2>&1

solution1-build:
	docker run -it -v ~/.m2/repository:/root/.m2/repository -w /usr/src/mymaven -v ${PWD}:/usr/src/mymaven --rm maven:3-jdk-8 mvn clean package -Dmaven.test.skip=true

solution1-package:
	docker build -t opstree/fasten-build -f Dockerfile.solution1

solution1-build-package:
	make solution1-build
	make solution1-package

solution1-build-package-with-time:
	time make solution1-build-package >/dev/null 2>&1

solution2-build-package:
	time docker build -t opstree/fasten-build -f Dockerfile.solution2 .

solution2-build-package-with-time:
	time make solution2-build-package >/dev/null 2>&1

solution3-build-builder:
	docker build -t opstree/fasten-build-builder -f Dockerfile.solution3.builder .

solution3-build-package:
	docker build -t opstree/fasten-build -f Dockerfile.solution3 .

solution3-build-package-with-time:
	time make solution3-build-package >/dev/null 2>&1

run-app:
	docker rm -f app || true
	docker run -p 8080:8080 -d --rm --name app opstree/fasten-build
