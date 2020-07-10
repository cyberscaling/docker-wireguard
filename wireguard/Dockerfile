FROM debian:buster

# Add debian backports repo for wireguard packages
RUN echo "deb http://deb.debian.org/debian/ buster-backports main" > /etc/apt/sources.list.d/buster-backports.list

ENV DEBIAN_FRONTEND="noninteractive"

# Install wireguard packges
RUN apt-get update && \
 apt-get install -y --no-install-recommends wireguard-tools iptables nano net-tools procps openresolv && \
 apt-get clean

RUN apt-get install -y \
    bc \
    curl \
    git \
    gnupg \
    ifupdown \
    jq \
    libelf-dev \
    pkg-config \
    qrencode && \    
    echo resolvconf resolvconf/linkify-resolvconf boolean false | debconf-set-selections && \
 echo "REPORT_ABSENT_SYMLINK=no" >> /etc/default/resolvconf && \
 apt-get install -y --no-install-recommends \
	resolvconf

RUN apt-get update && apt-get install -y ldnsutils

RUN mkdir /app 

RUN echo "**** install CoreDNS ****" && \
 COREDNS_VERSION=$(curl -sX GET "https://api.github.com/repos/coredns/coredns/releases/latest" \
	| awk '/tag_name/{print $4;exit}' FS='[""]' | awk '{print substr($1,2); }') && \
 curl -o \
	/tmp/coredns.tar.gz -L \
	"https://github.com/coredns/coredns/releases/download/v${COREDNS_VERSION}/coredns_${COREDNS_VERSION}_linux_amd64.tgz" && \
 tar xf \
	/tmp/coredns.tar.gz -C \
	/app && \
 echo "**** clean up ****" && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# Add main work dir to PATH
WORKDIR /scripts
ENV PATH="/scripts:${PATH}"

# Use iptables masquerade NAT rule
ENV IPTABLES_MASQ=1

# Copy scripts to containers
#COPY install-module /scripts
COPY run /scripts
COPY health /scripts
COPY genkeys /scripts
RUN chmod 755 /scripts/*

# Wirguard interface configs go in /etc/wireguard
VOLUME /etc/wireguard

COPY wg0.conf /etc/wireguard

# Normal behavior is just to run wireguard with existing configs
CMD ["run"]

EXPOSE 51820
