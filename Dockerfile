FROM jenkins/jnlp-slave:alpine

# Packages required for runtime
ENV APK_RUNTIME_PACKAGES="\
  alpine-sdk \
  yarn \
"

USER root

# Install runtime packages
RUN apk add --no-cache $APK_RUNTIME_PACKAGES

COPY run.sh /run.sh
RUN chmod 755 /run.sh

USER jenkins

ENTRYPOINT ["/run.sh"]
