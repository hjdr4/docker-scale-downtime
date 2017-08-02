FROM httpd:latest

RUN apt-get update && apt-get install -qqy curl

STOPSIGNAL  WINCH

HEALTHCHECK  --interval=5s --timeout=3s --retries=3 CMD curl --fail -s http://localhost |grep -i works

ADD entrypoint /

ENTRYPOINT ["/entrypoint"]
