## Example 5: NodeJS Tutorial

This tutorial utilizes two Docker containers with a custom SSH agent to demonstrate the [NodeJS Tutorial](https://www.jenkins.io/doc/tutorials/simple-node-js-react-npm-app/).

### Files

* `dockerfiles/Dockerfile`: Used to create a custom image from the `jenkins/jenkins` image and copies `plugins.txt` and `jenkins.yaml` into the container for plugin installation and JCasC configuration.
* `dockerfile/agent/Dockerfile`: Used to create a custom agent image from `jenkins/ssh-agent` with NodeJS installed, enabling it to perform the tutorial.
* `keygen.sh`: A script that generates new SSH keys in the secrets directory every time it runs and updates the Docker Compose file with the new keys.
* `fork-and-clone.sh`: A script that takes GitHub credentials from the user, forks, and clones a repository used in the tutorial from within a Docker container using the Dockerfile.
* `jenkins.yaml`: A JCasC configuration file that can be edited to customize the build accordingly.
* `gitpodURL.sh`: A script that replaces `http://127.0.0.1:8080` with the appropriate Gitpod URL in the `jenkins.yaml` file.
* `plugins.txt`: A list of plugins that are installed with the help of [`jenkins-plugin-cli`](https://www.jenkins.io/doc/book/managing/plugins/#install-with-cli).
* The `docker-compose.yaml` file defines two containers: the Jenkins controller and an agent. It connects them to a common network, sets the private key in the controller, and the public key in the agent, defines a named volume, and builds the image from the `Dockerfile`.

### Steps to run the example

1. Make sure you are in the `05_nodejs` directory by using the command `pwd`.
2. Run the script with the `./keygen.sh` command to generate new SSH keys.
3. Then use the command `docker compose up -d --build` to run the example.
4. After the containers are successfully running (check with `docker-compose ps`), you can access the controller by navigating to [`http://localhost:8080/`](http://localhost:8080/).
5. You can log in using the `admin` username and the `admin` password.

### Steps to follow the [NodeJS Tutorial](https://www.jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm)

- [Fork and clone the sample repository](https://www.jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/#fork-and-clone-the-sample-repository-on-github)
    - Before proceeding, ensure that you are in the `05_nodejs` directory, and confirm that both the `Dockerfile` and `fork-and-clone.sh` are present in this directory.
    - Run `./fork-and-clone.sh` command, and enter your GitHub credentials to get a clone of your fork of [`simple-node-js-react-npm-app`](https://github.com/jenkins-docs/simple-node-js-react-npm-app).
    - If everything ran successfully, you should have a `simple-node-js-react-npm-app` directory.

- [Create your initial Pipeline as a Jenkinsfile](https://www.jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/#create-your-pipeline-project-in-jenkins)
    - Go inside the `simple-node-js-react-npm-app` directory by using the command `cd simple-node-js-react-npm-app`.
    - Once inside the directory, create a `Jenkinsfile` and add the specified content to it:

      ```groovy
      pipeline {
        agent any
        stages {
            stage('Build') {
                steps {
                    sh 'npm install'
                }
            }
        }
      }
      ```

    - Save your `Jenkinsfile`.
    - Run the commands `git add .` to add the `Jenkinsfile` to the staging, then run `git commit -m "Add initial Jenkinsfile"` to commit the changes. Finally, run `git push origin master` to push the changes to your forked repo.

- Go to Jenkins, log in, and click "Create new jobs" under "Welcome to Jenkins!".
- In the "Enter an item name" field, specify the name for your new Multibranch Pipeline project (e.g., simple-node-js-react-npm-app).
- Scroll down and click "Multibranch Pipeline", then click "OK" at the end of the page.
- Click on "Add source" in the "Branch Sources" section below the description.
- Select Git and paste the link of your forked repo of the simple-node-js-react-npm-app in the "Repository" field. It will look something like this `https://github.com/<username>/simple-node-js-react-npm-app.git` (replace `<username>` with your GitHub username).
- Click "Save" at the bottom to save your new Multibranch Pipeline project. You're now ready to begin.
- It will automatically scan for all the branches in your repo. It'll search for the `master` branch in `simple-node-js-react-npm-app` and start building from the Jenkinsfile you pushed in the repo. Click on the "Status" section to see if your build was successful or not.

- [Add a test stage to your Pipeline](https://www.jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/#add-a-test-stage-to-your-pipeline)
    - Once again, open your `Jenkinsfile` and copy and paste the following Declarative Pipeline syntax under the Build stage of your Jenkinsfile. Then, save the file.

      ```groovy
      stage('Test') {
          steps {
              sh './jenkins/scripts/test.sh'
          }
      }
      ```

    - Run the command `git add .` to add the edited `Jenkinsfile` to the staging, then run `git commit -m "Add 'Test' stage"` to commit the changes. Finally, run `git push origin master` to push the changes to your forked repo.
    - Press the "Build Now" button to run both the Build and Test stages.


- [Add a final deliver stage to your Pipeline](https://www.jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/#add-a-final-deliver-stage-to-your-pipeline)
    - Once more, open your `Jenkinsfile` and copy-paste the following Declarative Pipeline syntax under the Test stage of your Jenkinsfile. Then, save the file.
        ```groovy
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
                // Remove the initial 'https://' and prepend 'https://3000-' to the URL.
                script {
                    def modifiedUrl = 'https://3000-' + env.GITPOD_WORKSPACE_URL.substring('https://'.length())
                    echo "If you are using Gitpod use this link instead ${modifiedUrl}"
                }

                input message: 'Finished using the website? (Click "Proceed" to continue)' 
                sh './jenkins/scripts/kill.sh' 
            }
        }
        ```
  - Run the command `git add .` to add the edited `Jenkinsfile` to the staging, then run `git commit -m "Add 'Deliver' stage"` to commit the changes. Afterward, run `git push origin master` to push the changes to your forked repository.
  - Press the "Build Now" button again to run the Build, Test, and Deliver stages.


### Clean Up Instructions

To stop and clean up a working Docker Compose setup, you can use the following command:

`docker compose down` 

This command stops the containers defined in your Docker Compose file and removes them, along with any networks, volumes, and other resources created by the Compose setup.
It effectively cleans up the resources associated with your Docker Compose environment.

By default, `docker compose down` removes the stopped containers and networks, but it preserves named volumes.
If you also want to remove the named volumes, you can use the `--volumes` flag:

`docker compose down --volumes` 

This command will ensure that all associated resources, including named volumes, are removed when bringing down the Docker Compose environment.

Note that the `docker compose down` command should be executed from the same directory where your `docker-compose.yaml` file is located.

To remove the named volume, run:

`docker volume rm 05_nodejs_jenkins_home`
