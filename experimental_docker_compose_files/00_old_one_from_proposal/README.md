## Example 0
### Old docker-compose file 
* This is the docker-compose file I created for the proposal, which mimics the steps from the docker section of the Jenkins docker page.
* This file does not configure any agent.
* More info about the file can be found in the proposal [here](https://docs.google.com/document/d/1ZpPihadYqpAvR20rxZkTD2SVpf34E6YMzg6opU6yHAg/edit#heading=h.lntg56ljm653).
### How to run 
* Make sure you are in the `00_old_one_from_proposal` directory by using the command `pwd`. 
* Then use the command `docker compose up -d` to run the example.
* after the containers are succefully running (check with `docker ps`). You can access the controller on [`http://localhost:8080`](http://localhost:8080)
### Clean Up Instructions 
* To clean, run `docker compose down`. This will remove the container and network.
* To remove the named volumes, run `docker volume rm 00_old_one_from_proposal_jenkins-docker-certs 00_old_one_from_proposal_jenkins-data` 