FROM debian:bullseye-slim

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends ngircd && \
    apt clean &&  \
    rm -rf /var/lib/apt/lists/* && \
    sed -ie 's/Name\s=\sirc.example.net/Name = irc.localhost/g' /etc/ngircd/ngircd.conf

CMD service ngircd start && while : ; do sleep 1; done

EXPOSE 6667
