FROM ubuntu:18.04 as BUILD

RUN apt-get update && apt-get install -y \
  build-essential \
  clang \
  git

RUN git clone https://github.com/yaneurao/YaneuraOu.git \
  && (cd ./YaneuraOu/source; make -j8)


FROM ubuntu:18.04

WORKDIR /work
ADD . /work
COPY --from=BUILD /YaneuraOu/source/YaneuraOu-by-gcc /work/YaneuraOu

CMD ["./YaneuraOu", ""]

