FROM debian

COPY .output/bin/ps3proxy /usr/local/bin/ps3proxy

CMD ["ps3proxy"]