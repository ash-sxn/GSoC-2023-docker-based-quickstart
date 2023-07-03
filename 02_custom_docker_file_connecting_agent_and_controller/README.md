## Example 2
### Custom Docker File connecting agent and controller 
This example builds a custom docker image to skip the upgrade wizard, installs default plugins, and configures Jenkins with JCasC.
### Files 
* The Dockerfile is used to create a custom image from the `jenkins/jenkins` image and copies `plugins.txt` and `jenkins.yaml` into the container for plugins installation and JCasC configuration.
* `keygen.sh` is a script that generates new ssh-keys in secrets directory everytime it runs and updates the docker compose file with new keys 

* ` jenkins.yaml` is a JCasC configuration file that can be edited to customize the build accordingly.
* `plugins.txt` is a list of plugins that are installed with the help of [`jenkins-plugin-cli`](https://www.jenkins.io/doc/book/managing/plugins/#install-with-cli).
* The `docker-compose.yaml` file defines two containers: the Jenkins controller and an agent. It then connects them to a common network, sets the private key in the controller and the public key in the agent, defines a named volume, and builds the image from the `Dockerfile`.

### Steps to run the example 
* Make sure you are in the `02_custom_docker_file_connecting_agent_and_controller` directory by using the command `pwd`. 
* Run the script with `./keygen.sh` command to generate ssh keys 
* Then use the command `docker compose up -d --build` to run the example.
* after the containers are successfully running (check with `docker compose ps`). You can access the controller on [`http://localhost:8080`](http://localhost:8080)
* You can log in using the `admin` username and the `admin` password.

### Clean Up Instructions 

* To stop and clean up a working Docker Compose setup, you can use the following command:
`docker compose down` 

This command stops the containers defined in your Docker Compose file and removes them along with any networks, volumes, and other resources created by the Compose setup.
It effectively cleans up the resources associated with your Docker Compose environment.

By default, `docker compose down` removes the stopped containers and networks, but it preserves named volumes.
If you also want to remove the named volumes, you can use the `--volumes` flag:
`docker compose down --volumes` 

This ensures that all resources, including volumes, are removed.

Note that the `docker compose down` command should be executed from the same directory where your `docker-compose.yml` file is located.
* To remove the named volume, run `docker volume rm 02_custom_docker_file_connecting_agent_and_controller_jenkins_home` 