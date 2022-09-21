FROM registry.access.redhat.com/ubi9/ubi-minimal

RUN rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm && \
    microdnf install -y atop && \
    microdnf remove -y epel-release && \
    microdnf clean all

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/usr/bin/atop"]
