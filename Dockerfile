FROM jenkins/jnlp-slave:alpine
USER root

# Packages required for runtime
ENV APK_RUNTIME_PACKAGES="\
  alpine-sdk \
  jq \
  groff \
  less \
  python \
  py-pip \
  yarn \
"

# Install runtime packages
RUN \
  apk add --no-cache $APK_RUNTIME_PACKAGES && \
  pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*


RUN \
  echo -e 'http://dl-cdn.alpinelinux.org/alpine/edge/main\nhttp://dl-cdn.alpinelinux.org/alpine/edge/community\nhttp://dl-cdn.alpinelinux.org/alpine/edge/testing' > /etc/apk/repositories \
  && apk add --no-cache docker 

# Mount the parent docker socket to enable docker builds
RUN \
  addgroup jenkins docker && \
  touch /var/run/docker.sock && \
  chown -R jenkins:docker /var/run/docker.sock

COPY run.sh /run.sh
RUN chmod 755 /run.sh

USER jenkins
ENTRYPOINT ["/run.sh"]
