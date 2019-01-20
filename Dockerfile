FROM openjdk

WORKDIR /depCheck

VOLUME ["/src", "/report"]

#Setup (OS updates, install tools)
RUN apt-get update && \
apt-get install -y --no-install-recommends wget unzip

RUN wget -q http://dl.bintray.com/jeremy-long/owasp/dependency-check-4.0.2-release.zip && \
unzip dependency-check-4.0.2-release.zip

RUN rm dependency-check-4.0.2-release.zip

#todo - update CVE database

# default argument for ENTRYPOINT
CMD ["--help"]

ENTRYPOINT ["./dependency-check/bin/dependency-check.sh"]
