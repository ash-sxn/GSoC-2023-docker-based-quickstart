## Example 3
### Maven Tutorial
This example uses 02 example with custom ssh agent to perform [Maven Tutorial](https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/) 
### Files 
* `dockerfiles/Dockerfile` is used to create a custom image from the `jenkins/jenkins` image and copies `plugins.txt` and `jenkins.yaml` into the container for plugins installation and JCasC configuration.
* `dockerfile/agent/Dockerfile` is used to create a custom agent image from `jenkins/ssh-agent` with maven installed to perform the tutorial
* `keygen.sh` is a script that generates new ssh-keys in secrets directory everytime it runs and updates the docker compose file with new keys 
* `fork-and-clone.sh` is script that takes github credentials from user and fork and clone a repo used in the tutorial from a docker container using Dockerfile 
* ` jenkins.yaml` is a JCasC configuration file that can be edited to customize the build accordingly.
* `gitpodURl.sh` is a script that replace `http://127.0.0.1:8080` with the gitpod appropriate url in the jenkins.yaml file
* `plugins.txt` is a list of plugins that are installed with the help of [`jenkins-plugin-cli`](https://www.jenkins.io/doc/book/managing/plugins/#install-with-cli).
* The `docker-compose.yaml` file defines two containers: the Jenkins controller and an agent. It then connects them to a common network, sets the private key in the controller and the public key in the agent, defines a named volume, and builds the image from the `Dockerfile`.

### Steps to run the example 
* Make sure you are in the `03_maven_tutorial` directory by using the command `pwd`. 
* Run the script with `./keygen.sh` command to generate ssh keys 
* Then use the command `docker compose up -d --build` to run the example.
* after the containers are successfully running (check with `docker compose ps`). You can access the controller on [`http://localhost:8080`](http://localhost:8080)
* You can log in using the `admin` username and the `admin` password.
### Steps to follow the [Maven Tutorial](https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven)

- [Fork and clone the sample repository](https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/#fork-and-clone-the-sample-repository-on-github)

  - Make sure you are in `03_maven_tutorial` directory and Dockerfile and fork-and-clone.sh is present there
  - Run `./fork-and-clone.sh` command, and enter your github credentails to get a clone of a your fork of [`simple-java-maven-app`](https://github.com/jenkins-docs/simple-java-maven-app)  
  - If everything ran sucessfully you should have a `simple-java-maven-app` directory 
- [Create your initial Pipeline as a Jenkinsfile](https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/#create-your-pipeline-project-in-jenkins)
  
  - get inside the `simple-java-maven` with `cd simple-java-maven` and create a `Jenkinsfile` with this content 
  ```
  pipeline {
      agent any
      stages {
          
          stage('Build') { 
              steps {
                  sh 'mvn -B -DskipTests clean package' 
              }
          }
      }
  }
  ```
  - Save your `Jenkinsfile` 
  - run the commands `git add .` to add the Jenkinsfile to the staging then run `git commit -m "Add initial Jenkinsfile"` to commit the changes, then run `git push origin master` to push the changes to you forked repo  
  - Go to Jenkins, log in and click create new jobs under Welcome to Jenkins!
  - In the Enter an item name field, specify the name for your new Multibranch Pipeline project (e.g. simple-java-maven-app).

  - Scroll down and click Multibranch Pipeline, then click OK at the end of the page.

  - Click on the Add source in the branch Sources section below discription 
  - Select Git and paste the link of your forked repo of the simple-java-maven-app in project Repository. it will look something like this `https://github.com/<username>/simple-java-maven-app.git` (replace `<username>` with your github username)

  - Click Save at the bottom to save your new Multibranch Pipeline project. You’re now ready to begin.

  - It will automatically scan for all the branches in your repo It'll search for `master` branch in `simple-java-maven-app` and start building from the jenkinsfile you pushed in the repo click on the Status section to see.

  - click on the `master`(branch name of your repo) to see if your build was sucessfull or not.


  - Again open your Jenkinsfile and Copy and paste the following Declarative Pipeline syntax under the Build stage of your Jenkinsfile and save the file

        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
  - run the commands `git add .` to add the edited Jenkinsfile to the staging then run `git commit -m "Add 'Test' stage"` to commit the changes, then run `git push origin master` to push the changes to you forked repo   
  - The Press the `Build Now` button to run the both Build and Test stage
- [Add a final deliver stage to your Pipeline](https://www.jenkins.io/doc/tutorials/build-a-java-app-with-maven/#add-a-final-deliver-stage-to-your-pipeline)
  
  - Again open your Jenkinsfile and Copy and paste the following Declarative Pipeline syntax under the Test stage of your Jenkinsfile and save the file

        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
  - run the commands `git add .` to add the edited Jenkinsfile to the staging then run `git commit -m "Add 'Deliver' stage"` to commit the changes, then run `git push origin master` to push the changes to you forked repo   
  - The Press the `Build Now` button to run Build, Test and Deliver stages

### Clean Up Instructions 

* To stop and clean up a working Docker Compose setup, you can use the following command:
`docker compose down` 

This command stops the containers defined in your Docker Compose file and removes them along with any networks, volumes, and other resources created by the Compose setup.
It effectively cleans up the resources associated with your Docker Compose environment.

By default, `docker compose down` removes the stopped containers and networks, but it preserves named volumes.
If you also want to remove the named volumes, you can use the `--volumes` flag:
`docker compose down --volumes` 

This ensures that all resources, including volumes, are removed.

Note that the `docker compose down` command should be executed from the same directory where your `docker-compose.yaml` file is located.
* To remove the named volume, run `docker volume rm 03_maven_tutorial_jenkins_home` 