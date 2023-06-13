# Docker-based Jenkins quick start examples

* This is an experiment repository for the GSoC 2023 docker-based Jenkins quick start examples project 

## Proposal

* You can find the proposal for this project [here](https://docs.google.com/document/d/1ZpPihadYqpAvR20rxZkTD2SVpf34E6YMzg6opU6yHAg/edit#heading=h.lntg56ljm653).

## Links

* Meeting notes for this project can be found [here](https://docs.google.com/document/d/1yij9OvM2_92My3vqjn6u8ABHjXcyy0a7O6oM30b6ctM/edit).
* Project page can be found [here](https://www.jenkins.io/projects/gsoc/2023/projects/docker-compose-build/).

## How to Run with Gitpod  
* Gitpod is a cloud development environment for teams to efficiently and securely develop software.
* Gitpod supports many IDEs, such as VScode, IntelliJ, and many more.  

 ### How to setup the repo in Gitpod?
* For starting your gitpod workspace you can use `gitpod.io/#` as a prefix on any GitHub, gitlab, or bitbucket repo URL
* For our repo you can get the gitpod workspace from [here](https://gitpod.io/#https://github.com/ash-sxn/GSoC-2023-docker-based-quickstart)  
* But If you do plan to use gitpod in the future, it's recommended to install the gitpod extension which will create a launch with gitpod button on every GitHub repo you visit, It can be found [here](https://chrome.google.com/webstore/detail/gitpod-online-ide/dodmmooeoklaejobgleioelladacbeki) for Chromium and [here](https://addons.mozilla.org/firefox/addon/gitpod/) for Firefox.
### Steps to run examples from the repo
* The first step is to get into the `experimental_docker_compose_files` directory by running `cd experimental_docker_compose_files`.
* Then change the directory to the example you want to run. For example, for `01_simple_controller+agent`, run `cd 01_simple_controller+agent`
* For most of the examples there will be a `docker-compose.yaml` present in the directory associated with the example.
* Only command needed is `docker compose up -d --build` ( -d is not necessary but frees up the terminal ) 
* Please make sure that  you are in the correct directory and that there is a `docker-compose.yaml` file present there
### How to Verify Jenkins was installed 
* You can check the status of the container with the `docker ps` command 
* If containers are running successfully you should see a pop-up titled `A service is available on port 8080`, If it doesn't come up, you can see the running service from the `PORTS` section on the right part of the terminal 
