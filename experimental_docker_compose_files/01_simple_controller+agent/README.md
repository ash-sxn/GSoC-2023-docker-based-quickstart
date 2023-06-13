## Example 1
### First docker-compose file of the project 
* This is a simple docker-compose file that runs two containers, a Jenkins controller and an agent, and gives the agent the public ssh key as an environment variable.
* However, the agent needs to be connected manually to the container from the UI.
* The SSH key used can be found in the ../ssh_keys directory.
### How to run 
* Make sure you are in the `01_simple_controller+agent` directory by using the command `pwd`. 
* Then use the command `docker compose up -d` to run the example.
