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

COPY run.sh /run.sh
RUN chmod 755 /run.sh

USER jenkins
ENTRYPOINT ["/run.sh"]
