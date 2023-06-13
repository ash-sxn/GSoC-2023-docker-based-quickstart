## Example 2
### Custom Docker File connecting agent and controller 
This example builds a custom docker image to skip the upgrade wizard, install default plugins, and configure Jenkins with JCasC.
### Files 
* Dockerfile is used to create a custom image from the `jenkins/jenkins` image and copy plugins.txt and jenkins.yaml into the container for plugin installation and JCasC configuration.
* jenkins_agent_ed is an ed25519 private ssh key used in the setup.
* jenkins.yaml is a JCasC configuration file that can be edited to customize the build accordingly.
* plugins.txt is a list of plugins that are installed with the help of jenkins-plugin-cli.
* The docker-compose.yaml file defines 2 containers, the Jenkins controller and agent, connects them to a network, gets the private key in the controller and public key in the agent, defines a named volume, and also builds the image from the Dockerfile.

### Steps to run the example 
* Make sure you are in the `02_custom_docker_file_connecting_agent_and_controller` directory by using the command `pwd`. 
* Then use the command `docker compose up -d` to run the example.
