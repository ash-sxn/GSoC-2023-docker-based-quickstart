FROM jenkins/jenkins:2.401.2-lts
USER root
COPY jobs /var/jenkins_home/jobs
RUN chown -R jenkins:jenkins /var/jenkins_home/jobs
RUN apt-get update && apt-get install -y apache2 && a2enmod proxy && a2enmod proxy_http && a2enmod headers
ARG JENKINS_HOST=localhost
RUN printf '<VirtualHost *:80>\n  ServerName localhost\n  ProxyPass /jenkins http://%s:8080/jenkins nocanon\n  ProxyPassReverse /jenkins http://%s:8080/jenkins\n  ProxyRequests Off\n  AllowEncodedSlashes NoDecode\n  <Proxy http://%s:8080/jenkins*>\n    Order deny,allow\n    Allow from all\n  </Proxy>\n</VirtualHost>' "$JENKINS_HOST" "$JENKINS_HOST" "$JENKINS_HOST" > /etc/apache2/sites-available/jenkins.conf
USER jenkins
RUN echo "2.0" > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
