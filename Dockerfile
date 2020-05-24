ARG BASE_IMAGE=alpine:3.11
ARG MIRRIR=dl-cdn.alpinelinux.org
ARG CALICOCTL_VERSION=v3.14.0
ARG TERMSHARK_VERSION=2.1.1

FROM ${BASE_IMAGE}
ARG MIRRIR
RUN set -ex \
    && sed -i 's#dl-cdn.alpinelinux.org#'${MIRRIR}'#g' /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk add --no-cache \
        ca-certificates \
        apache2-utils \
        bash \
        bind-tools \
        bird \
        bridge-utils \
        busybox-extras \
        conntrack-tools \
        curl \
        dhcping \
        drill \
        ethtool \
        file\
        fping \
        httpie \
        iftop \
        iperf \
        iproute2 \
        ipset \
        iptables \
        iptraf-ng \
        iputils \
        ipvsadm \
        jq \
        libc6-compat \
        liboping \
        mtr \
        net-snmp-tools \
        netcat-openbsd \
        nftables \
        ngrep \
        nmap \
        nmap-nping \
        openssl \
        # py-crypto \
        # py2-virtualenv \
        scapy \
        socat \
        strace \
        tcpdump \
        tcptraceroute \
        tshark \
        util-linux \
        vim \
    && rm -rf /etc/apk/*
     
# apparmor issue #14140
RUN mv /usr/sbin/tcpdump /usr/bin/tcpdump

# Installing ctop - top-like container monitor
RUN    wget https://github.com/bcicen/ctop/releases/download/v0.7.1/ctop-0.7.1-linux-amd64 -O /usr/local/bin/ctop \
    && chmod +x /usr/local/bin/ctop

# Installing calicoctl
ARG CALICOCTL_VERSION
RUN    wget https://github.com/projectcalico/calicoctl/releases/download/${CALICOCTL_VERSION}/calicoctl -O /usr/local/bin/calicoctl \
    && chmod +x /usr/local/bin/calicoctl

# Installing termshark
ARG TERMSHARK_VERSION
RUN    wget https://github.com/gcla/termshark/releases/download/v${TERMSHARK_VERSION}/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz -O /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz \
    && tar -C /tmp/ -zxvf /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz \
    && mv /tmp/termshark_${TERMSHARK_VERSION}_linux_x64/termshark /usr/local/bin/termshark \
    && chmod +x /usr/local/bin/termshark \
    && rm -rf /tmp/termshark_${TERMSHARK_VERSION}_linux_x64.tar.gz


# FROM ${BASE_IMAGE}
# COPY --from=build /usr/bin       /usr/bin
# COPY --from=build /usr/sbin      /usr/sbin
# COPY --from=build /usr/local/bin /usr/local/bin
# COPY --from=build /usr/lib       /usr/lib
# COPY --from=build /lib           /lib

WORKDIR /root
CMD [ "sleep", "1000" ]