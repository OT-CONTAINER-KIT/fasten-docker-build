lengthy-build:
	DOCKER_BUILDKIT=1
	time docker build -t fasten-build/problem -f Dockerfile.problem .

solution1-build:
	time docker run -it -v ~/.m2/repository:/root/.m2/repository -w /usr/src/mymaven -v ${PWD}:/usr/src/mymaven --rm maven:3-jdk-8 mvn clean package -Dmaven.test.skip=true

solution1-package:
	time docker build -t fasten-build/problem -f Dockerfile.solution1 .
	
run-app:
	docker rm -f app || true
	docker run -p 8080:8080 -d --rm --name app fasten-build/problem
