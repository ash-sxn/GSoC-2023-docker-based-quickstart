FROM jenkins/ssh-agent:5.7.0-jdk17 as ssh-agent

# Install Python 3 and pip3
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install pytest pyinstaller 