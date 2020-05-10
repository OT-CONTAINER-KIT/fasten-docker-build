lengthy-build:
	DOCKER_BUILDKIT=1
	docker build -t opstree/fasten-build -f Dockerfile.problem .

solution1-build:
	time docker run -it -v ~/.m2/repository:/root/.m2/repository -w /usr/src/mymaven -v ${PWD}:/usr/src/mymaven --rm maven:3-jdk-8 mvn clean package -Dmaven.test.skip=true

solution1-package:
	docker build -t opstree/fasten-build -f Dockerfile.solution1 .

solution2-build-package:
	time docker build -t opstree/fasten-build -f Dockerfile.solution2 .

run-app:
	docker rm -f app || true
	docker run -p 8080:8080 -d --rm --name app opstree/fasten-build
