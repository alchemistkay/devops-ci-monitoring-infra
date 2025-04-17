FROM jenkins/jenkins:lts-jdk17

# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

# Disable the setup wizard as we will set up Jenkins as code
# ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

