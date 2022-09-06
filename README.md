# docker-bfgroup-b2

The image offers the same functionality as B2 ([documentation](https://www.bfgroup.xyz/b2/manual/release/index.html)).

## How to use this image
* Without parameters creates a release build with address model 64
```
docker run -it --rm -v ${PWD}:/usr/src/Project -w /usr/src/Project marcusstuht/bfgroup-b2:4.9.2-gcc-12.2.0
```
* With parameters
```
docker run -it --rm -v ${PWD}:/usr/src/Project -w /usr/src/Project marcusstuht/bfgroup-b2:4.9.2-gcc-12.2.0 debug toolset=gcc-12.2.0 address-model=64
```
