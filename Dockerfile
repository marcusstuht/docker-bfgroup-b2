FROM gcc:12.2.0 as builder 

LABEL maintainer "m4s.s3t@gmail.com"

ADD https://github.com/bfgroup/b2/archive/refs/tags/4.9.2.tar.gz /usr/src

WORKDIR /usr/src

RUN tar -xzf 4.9.2.tar.gz && rm 4.9.2.tar.gz

WORKDIR /usr/src/b2-4.9.2

RUN ./bootstrap.sh

RUN ./b2 install --prefix=../B2

FROM gcc:12.2.0

LABEL maintainer "m4s.s3t@gmail.com"

RUN groupadd -r developer && useradd -g developer developer

COPY --from=builder --chown=developer:developer /usr/src/B2 /usr/src/B2

USER developer

ENTRYPOINT ["/usr/src/B2/bin/b2"]

CMD ["toolset=gcc-12.2.0", "address-model=64", "release"]
