# Overview

Docker for build [Zephyr](https://www.zephyrproject.org/) application

## Example

```
cd application
docker run --rm -it -v `pwd`/..:`pwd`/.. -w `pwd` -u `id -u`:`id -g` hardwario/zephyr-build:latest west build
```


## Hint
For easier using recommended add alias to ~/.bashrc
```
alias wmake='docker run --rm -it -v `pwd`/..:`pwd`/.. -w `pwd` -u `id -u`:`id -g` hardwario/zephyr-build:latest'
```

## Workdir
* /builds

## Local build

```
docker build -t hardwario/zephyr-build:latest .
```
