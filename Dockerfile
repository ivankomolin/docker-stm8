FROM ubuntu:18.04 as build

RUN apt-get update

RUN apt-get install -y git make pkg-config libusb-1.0 sdcc

RUN git clone https://github.com/vdudouyt/stm8flash.git

RUN cd stm8flash && make || true


FROM ubuntu:18.04

COPY --from=build /stm8flash/stm8flash /usr/bin/sdcc /usr/bin/

COPY --from=build /usr/share/sdcc /usr/share/

COPY --from=build /lib/x86_64-linux-gnu/libusb-1.0* /lib/x86_64-linux-gnu/