FROM ubuntu:16.04
MAINTAINER <panther93@protonmail.com>

WORKDIR /root
RUN apt update
RUN apt-get install -y wget
RUN wget https://github.com/BTCGPU/BTCGPU/releases/download/v0.15.0.2/bitcoin-gold-0.15.0-x86_64-linux-gnu.tar.gz
RUN tar -zvxf bitcoin-gold-0.15.0-x86_64-linux-gnu.tar.gz
RUN mv bitcoin-gold-0.15.0 bitcoingold
RUN cp bitcoingold/bin/* /usr/local/bin

VOLUME ["/opt/bitcoingold"]

EXPOSE 8332
EXPOSE 8338
EXPOSE 18332
EXPOSE 18338
EXPOSE 18444

CMD ["bgoldd", "--conf=/opt/bitcoingold/bitcoingold.conf", "--printtoconsole"]
