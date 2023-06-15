FROM jenkins/jenkins:2.401.1-lts
USER root
COPY jobs /var/jenkins_home/jobs
RUN chown -R jenkins:jenkins /var/jenkins_home/jobs
USER jenkins
RUN echo "2.0" > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
COPY jenkins.yaml /var/jenkins_home/casc_configs/jenkins.yaml
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc_configs/jenkins.yaml
