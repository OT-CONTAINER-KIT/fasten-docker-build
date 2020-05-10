# Reduce your Docker build time from 3 min to 4 second

This is a sample repository for a HelloWorld springboot project, showcasing  various ways through which image building can be reduced drastically.

The complete process is divided in 4 steps
* Initial problematic build
* Solution1
* Solution2
* Solution3

## Initial problematic build
In this section we are simulating the time consuming image building process where image build process takes >3 minutes
[Problematic Docker file](./Dockerfile.problem)
You can run make target to validate the image creation part
```
$ make problem-build-package-with-time
real	3m3.356s
user	0m1.221s
sys	0m1.067s
```

## Solution1
The base of the problem is that every time image is built dependencies are downloaded, if somehow we can fix that problem the problem would be solved.
Docker build has an issue where you can't do a volume mounting as a result of which you can't leverage reuse of already downloaded files.
In this solution we have broken artefact generation and image creation. Artefact generation is done using a docker container so that we can resuse local maven repository  
[Solution1 Docker file](./Dockerfile.solution1)
You can run make target to validate the image creation part
```
$ make solution1-build-package-with-time
time make solution1-build-package >/dev/null 2>&1

real	0m15.212s
user	0m0.288s
sys	0m0.286s
```
