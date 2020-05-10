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
make problem-build-package-with-time
real	3m3.356s
user	0m1.221s
sys	0m1.067s
```
