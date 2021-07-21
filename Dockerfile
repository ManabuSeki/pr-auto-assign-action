FROM alpine:3.12

ENV PR_AUTO_ASSIGN_VERSION=v0.0.4

RUN apk add --no-cache --virtual=build-deps wget unzip && \
  wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && \
  mv jq-linux64 /usr/local/bin/jq && \
  chmod +x /usr/local/bin/jq && \
  wget https://github.com/ManabuSeki/pr-auto-assign/releases/download/$(echo $PR_AUTO_ASSIGN_VERSION)/pr_auto_assign_$(echo $PR_AUTO_ASSIGN_VERSION)_linux_amd64.zip && \
  unzip pr_auto_assign_$(echo $PR_AUTO_ASSIGN_VERSION)_linux_amd64.zip &&\
  mv pr_auto_assign /usr/local/bin/pr_auto_assign && \
  chmod +x /usr/local/bin/pr_auto_assign && \
  apk del build-deps

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
