## Example 2
### Custom Docker File connecting agent and controller 
This example builds a custom docker image to skip the upgrade wizard, installs default plugins, and configures Jenkins with JCasC.
### Files 
* The Dockerfile is used to create a custom image from the `jenkins/jenkins` image and copies `plugins.txt` and `jenkins.yaml` into the container for plugins installation and JCasC configuration.
* `jenkins_agent_ed` is an `ed25519` private ssh key used in the setup.
*` jenkins.yaml` is a JCasC configuration file that can be edited to customize the build accordingly.
* `plugins.txt` is a list of plugins that are installed with the help of [`jenkins-plugin-cli`](https://www.jenkins.io/doc/book/managing/plugins/#install-with-cli).
* The `docker-compose.yaml` file defines two containers: the Jenkins controller and an agent. It then connects them to a common network, sets the private key in the controller and the public key in the agent, defines a named volume, and builds the image from the `Dockerfile`.

### Steps to run the example 
* Make sure you are in the `02_custom_docker_file_connecting_agent_and_controller` directory by using the command `pwd`. 
* Then use the command `docker compose up -d --build` to run the example.
