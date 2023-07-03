# Docker-based Jenkins quick start examples

* This is an experiment repository for the GSoC 2023 docker-based Jenkins quick start examples project 

## Proposal

* You can find the proposal for this project [here](https://docs.google.com/document/d/1ZpPihadYqpAvR20rxZkTD2SVpf34E6YMzg6opU6yHAg/edit#heading=h.lntg56ljm653).

## Links

* Meeting notes for this project can be found [here](https://docs.google.com/document/d/1yij9OvM2_92My3vqjn6u8ABHjXcyy0a7O6oM30b6ctM/edit).
* Project page can be found [here](https://www.jenkins.io/projects/gsoc/2023/projects/docker-compose-build/).

## Gitpod  
* Gitpod is a cloud development environment for teams to efficiently and securely develop software.
* Gitpod supports many IDEs, such as VScode, IntelliJ, and many more.  

 ### How to setup the repo in Gitpod?
* For starting your gitpod workspace you can use `gitpod.io/#` as a prefix on any GitHub, gitlab, or bitbucket repo URL
* For our repo you can get the gitpod workspace from [here](https://gitpod.io/#https://github.com/ash-sxn/GSoC-2023-docker-based-quickstart)  
* But If you do plan to use gitpod in the future, it's recommended to install the gitpod extension which will create a launch with the gitpod button on every GitHub repo you visit.
It can be found [here](https://chrome.google.com/webstore/detail/gitpod-online-ide/dodmmooeoklaejobgleioelladacbeki) for Chromium and [here](https://addons.mozilla.org/firefox/addon/gitpod/) for Firefox.
### Steps to run examples from the repo
* `jenkins_init.sh` script is used to run examples from the project 
    * There are three working examples in the project right now :- 
      * 00_old_one_from_proposal
      * 01_simple_controller_plus_agent
      * 02_custom_docker_file_connecting_agent_and_controller
      * 03_maven_tutorial (Not ready yet)
* to run the different examples add these arguments to the ./jenkins_init.sh command

    * `old` - 00_old_one_from_proposal => `./jenkins_init.sh old`
    * `manual` - 01_simple_controller_plus_agent => `./jenkins_init.sh manual`
    * `new` - 02_custom_docker_file_connecting_agent_and_controller => `./jenkins_init.sh new`
    * `maven` - 03_maven_tutorial (doesn't work right now, still in devlopment ) => `./jenkins_init.sh maven`
* If no argument is used i.e. `./jenkins_init.sh`, It runs the latest example present in the root directory docker-compose file

### How to Verify Jenkins installation
* You can check the status of the container with the `docker ps` command or the `docker compose ps` one.
* You can Access your running Jenkins on [http://127.0.0.1:8080](http://127.0.0.1:8080)
* On gitpod If containers are running successfully you should see a pop-up titled `A service is available on port 8080`. If it doesn't come up, you can see the running service from the `PORTS` section on the right part of the terminal .

### Clean Up Instructions
* To stop and remove the running containers `jenkins_teardown.sh` script is used  
* use `./jenkins_teardown.sh` command to stop and remove the running example 