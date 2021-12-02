FROM alpine:3.15
LABEL maintainer="mario.siegenthaler@linkyard.ch"

RUN apk --no-cache add bash
RUN apk --no-cache add --update curl ca-certificates
RUN apk --no-cache add jq gettext

ENV KUBE_VERSION="v1.21.7"

RUN curl -L https://dl.k8s.io/release/${KUBE_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && chmod +x /usr/local/bin/kubectl

COPY initK8s.sh /opt/
