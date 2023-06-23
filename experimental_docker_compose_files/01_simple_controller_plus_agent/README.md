## Example 1
### First docker-compose file of the project 
* This is a simple docker-compose file that runs two containers, a Jenkins controller and an agent, and gives the agent the public ssh key as an environment variable.
* However, the agent needs to be connected manually to the container from the UI.
* The SSH key used can be found in the ../ssh_keys directory.
### How to run 
* Make sure you are in the `01_simple_controller_plus_agent` directory by using the command `pwd`. 
* Then use the command `docker compose up -d --build` to run the example.
* after the containers are successfully running (check with `docker compose ps`). You can access the controller on [`http://localhost:8080`](http://localhost:8080)
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
* To remove the named volume, run `docker volume rm 01_simple_controller_plus_agent_jenkins_home` 