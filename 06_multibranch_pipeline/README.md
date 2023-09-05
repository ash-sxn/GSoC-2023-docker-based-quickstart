## Example 6: End-to-End Multibranch Pipeline Tutorial

This tutorial utilizes Docker containers with a custom SSH agent to demonstrate the [End-to-End Multibranch Pipeline Tutorial](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/).

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

1. Make sure you are in the `06_multibranch_pipeline` directory by using the command `pwd`.
2. Run the script with the `./keygen.sh` command to generate new SSH keys.
3. Then use the command `docker compose up -d --build` to run the example.
4. After the containers are successfully running (check with `docker-compose ps`), you can access the controller by navigating to [`http://localhost:8080/`](http://localhost:8080/).
5. You can log in using the `admin` username and the `admin` password.

### Steps to follow the [End-to-End Multibranch Pipeline Tutorial](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/)

- [Fork and clone the sample repository](https://www.jenkins.io/doc/tutorials/build-a-node-js-and-react-app-with-npm/#fork-and-clone-the-sample-repository-on-github)
    - Before proceeding, ensure that you are in the `06_multibranch_pipeline` directory, and confirm that both the `Dockerfile` and `fork-and-clone.sh` are present in this directory.
    - Run `./fork-and-clone.sh` command, and enter your GitHub credentials to get a clone of your fork of [`building-a-multibranch-pipeline-project
`](https://github.com/jenkins-docs/building-a-multibranch-pipeline-project).
    - If everything ran successfully, you should have a `building-a-multibranch-pipeline-project
` directory.

- [Create development and production branches in your repository](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/#create-development-and-production-branches-in-your-repository)

    - Before creating your Pipeline project in Jenkins, create "development" and "production" branches of your locally cloned Git repository. You’ll be creating a single Jenkinsfile (initially in the master branch, which you’ll pull into the other branches) whose stages will be selectively executed based on the branch that Jenkins is building from.

    - Within the building-a-multibranch-pipeline-project directory (i.e. your local clone of the sample repository):

    - Run the following commands to create these branches (from the contents of the master branch):

    ```
    git branch development
    git push origin development

    git branch production
    git push origin production
    ```
    - Check that these branches now exist by running the command git branch, which should give you:

    ```
      development
    * master
      production
    ```

    If the asterisk (indicating the current branch) does not appear next to master, run the command git checkout master to ensure that master is the current branch.

- [Create your initial Pipeline as a Jenkinsfile with build and test stages](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/#create-your-initial-pipeline-as-a-jenkinsfile-with-build-and-test-stages)

    - Go inside the `building-a-multibranch-pipeline-project
` directory by using the command `cd building-a-multibranch-pipeline-project
`.
    - Once inside the directory, create a `Jenkinsfile` and add the specified content to it:

      ```groovy
        pipeline {
        agent any
        environment {
            CI = 'true'
        }
        stages {
            stage('Build') {
                steps {
                    sh 'npm install'
                }
            }
            stage('Test') {
                steps {
                    sh './jenkins/scripts/test.sh'
                }
            }
        }
        }
        
      ```

    - Save your `Jenkinsfile`.
    - Run the commands `git add .` to add the `Jenkinsfile` to the staging, then run `git commit -m "Add initial Jenkinsfile"` to commit the changes. Finally, run `git push origin master` to push the changes to your forked repo.

- [Create your pipeline project in Blue Ocean](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/#create-your-pipeline-project-in-blue-ocean)

    - Whenever you create any Pipeline project in Blue Ocean, Jenkins actually creates this as a multibranch Pipeline project behind the scenes. This becomes apparent if you were to access Jenkins’s classic interface after creating a Pipeline project in Blue Ocean; you’ll see that Jenkins will have created your project as a "Multibranch Pipeline" project.
    - Go back to Jenkins and ensure you have accessed the Blue Ocean interface. To do this, make sure you:

        - have browsed to http://localhost:8080/blue and are logged in or

        - have browsed to http://localhost:8080/, are logged in and have clicked Open Blue Ocean on the left.
    - In the Welcome to Jenkins box at the center of the Blue Ocean interface, click Create a new Pipeline to begin the Pipeline creation wizard.
    
        Note: If you don’t see this box, click New Pipeline at the top right.
    - In the Repository URL field, Paste the link of your forked repo from the `building a multibranch piepline project` repo. Your URL should look like this `https://github.com/<user-name>/building-a-multibranch-pipeline-project.git`. Make sure to replace `<user-name>` with your github username.
    - Click Save to save your new Pipeline project.
Blue Ocean detects the presence of the Jenkinsfile "Pipeline stub" in each branch and proceeds to run each Pipeline against its respective branch, whose build results are shown on the Activity page of the main Blue Ocean interface.
    - You should be able to see Build & Test stages running on your master branch now.

    

- [Add deliver and deploy stages to your Pipeline](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/#add-deliver-and-deploy-stages-to-your-pipeline)
    - Once again, open your `Jenkinsfile` and copy and paste the following Declarative Pipeline syntax under the Build stage of your Jenkinsfile. Then, save the file.

      ```groovy
      stage('Deliver for development') {
            when {
                branch 'development'
            }
            steps {
                sh './jenkins/scripts/deliver-for-development.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deploy for production') {
            when {
                branch 'production'
            }
            steps {
                sh './jenkins/scripts/deploy-for-production.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
      ```

    - Run the command `git add .` to add the edited `Jenkinsfile` to the staging, then run `git commit -m "Add 'Test' stage"` to commit the changes. Finally, run `git push origin master` to push the changes to your forked repo.
    - Go back to Jenkins again, log in again if necessary and ensure you’ve accessed Jenkins’s Blue Ocean interface.

    - Click Branches at the top right to access the list of your Pipeline project’s branches.

    - Click the run icon Run icon of the master branch of your Pipeline project, then quickly click the OPEN link that appears briefly at the lower-right to see Jenkins building the master branch with the amended Jenkinsfile. If you weren’t able to click the OPEN link, click the top row on the Blue Ocean Activity page to access this feature.
    - Notice how Jenkins skips the last two stages you added, since the branch you are running the build from (master) does not meet the when directives' branch conditions in these stages.
    - Click the X at the top-right to return to the Activity page of the Blue Ocean interface.



- [Pull your updated Jenkinsfile into the other repository branches](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/#pull-your-updated-jenkinsfile-into-the-other-repository-branches)
    - Now that you have a completed Jenkinsfile to build your application in Jenkins, you can pull this file from the master branch of your local repository into its development and production branches.

    - Within your local repository’s building-a-multibranch-pipeline-project directory:

    - Run the following commands to pull changes from master to development:

    - `git checkout development`
        
        and

    - `git pull . master`
    - `git push origin development`

    - Also run the following commands to pull changes from master to production:

    - `git checkout production`

        and

    - `git pull . master`
    - `git push origin production`

    - Your development and production branches should now have all your Jenkinsfile updates you made on the master branch.

- [Run Your Pipeline on the development branch](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/#run-your-pipeline-on-the-development-branch)

    - Go back to Jenkins again, log in again if necessary and ensure you’ve accessed Jenkins’s Blue Ocean interface.

    - Click Branches at the top right to access the list of your Pipeline project’s branches.

    - Click the run icon Run icon of the development branch of your Pipeline project, then quickly click the OPEN link that appears briefly at the lower-right to see Jenkins building the development branch with the amended Jenkinsfile. If you weren’t able to click the OPEN link, click the top row on the Blue Ocean Activity page to access this feature.

    - Within a few minutes and when the build pauses, ensure you are viewing the Deliver for development stage (click it if necessary), then click the top green Shell Script step to expand its contents and scroll down until you see the http://localhost:3000 link.
    - Click the http://localhost:3000 link to view your Node.js and React application running in development mode (with the npm start command) in a new web browser tab. You should see a page/site with the title Welcome to React on it.

    - When you are finished viewing the page/site, click the Proceed button in Blue Ocean to complete the Pipeline’s execution.
    - The Blue Ocean interface turns green if Jenkins built your Node.js and React application successfully from your development branch. Notice how the Deliver for development stage was executed but the Deploy for production stage was not.
    - Click the X at the top-right to return to the Activity page of the Blue Ocean interface.

- [Run your Pipeline on the production branch](https://www.jenkins.io/doc/tutorials/build-a-multibranch-pipeline-project/#run-your-pipeline-on-the-production-branch)
   
   - Click Branches at the top right to access the list of your Pipeline project’s branches.

    - Click the run icon Run icon of the production branch of your Pipeline project, then quickly click the OPEN link that appears briefly at the lower-right to see Jenkins building the production branch with the amended Jenkinsfile. If you weren’t able to click the OPEN link, click the top row on the Blue Ocean Activity page to access this feature.

    - Within a few minutes and when the build pauses, ensure you are viewing the Deploy for production stage (click it if necessary), then click the top green Shell Script step to expand its contents and scroll down until you see the http://localhost:5000 link.

    - Click the http://localhost:5000 link to view your Node.js and React application in a new web browser tab. This will be running in production mode from a production build of your source code (generated using the npm run build command). Again, you should see a page/site with the title Welcome to React on it. However, this time, the application’s contents are served by the npm serve module and are also likely to continue running in the background in your browser.

    - When you are finished viewing the page/site, click the Proceed button in Blue Ocean to complete the Pipeline’s execution.
    The Blue Ocean interface turns green if Jenkins built your Node.js and React application successfully from your production branch. Notice how the Deploy for production stage was executed but the Deliver for development stage was skipped.
    - Click the X at the top-right to return to the Activity page of the Blue Ocean interface.

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

`docker volume rm 06_multibranch_pipeline`
