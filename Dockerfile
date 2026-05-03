FROM ubuntu:22.04

RUN apt update && apt install -y \
git build-essential cmake \
libirrlicht-dev liblua5.1-0-dev \
libzstd-dev libopenal-dev libvorbis-dev \
libfreetype6-dev libsqlite3-dev libjpeg-dev libpng-dev

RUN git clone https://github.com/luanti-org/luanti.git

WORKDIR /luanti

RUN cmake . -DRUN_IN_PLACE=TRUE -DBUILD_SERVER=1 -DBUILD_CLIENT=0 -DENABLE_OPENGL=OFF
RUN make -j2

EXPOSE 30000/udp

CMD ["./bin/luantiserver"]
