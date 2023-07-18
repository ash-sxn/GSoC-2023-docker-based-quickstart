FROM jenkins/ssh-agent:5.7.0-jdk17 as ssh-agent

# ca-certificates because curl will need it later on for the Maven installation
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates curl 

# Now time to install Maven
ARG MAVEN_VERSION=3.9.2
# Add a checksum for the maven binary
RUN curl -sS -L -O --output-dir /tmp/ --create-dirs  https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && echo "$(sha512sum /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz)" | sha512sum -c - \
    && curl -sS -L -O --output-dir /tmp/ --create-dirs  https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512 \
    && echo "$(cat /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz.sha512) /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz" | sha512sum --check --status \
    && tar xzf "/tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz" -C /opt/ \
    && rm "/tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
    && ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven \
    && ln -s /opt/maven/bin/mvn /usr/bin/mvn \
    && mkdir -p /etc/profile.d \
    && echo "export JAVA_HOME=$JAVA_HOME \n \
             export M2_HOME=/opt/maven \n \
             export PATH=${M2_HOME}/bin:${PATH}" > /etc/profile.d/maven.sh
ENV M2_HOME="/opt/maven"
ENV PATH="${M2_HOME}/bin/:${PATH}"
RUN echo "PATH=${PATH}" >> /etc/environment

RUN chown -R jenkins:jenkins "${JENKINS_AGENT_HOME}"

