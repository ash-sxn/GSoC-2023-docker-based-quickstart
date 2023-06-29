# Daily Update

### Date: 28/06/2023 WEDNESDAY

**Start Time:** 8:35 AM  
**End Time:** 23:56 PM  
**Hours Worked:** 8 hours 57 mins

**8:35 AM - 10:12 AM (1 hour and 37 minutes)**

- Overslept a little today, so starting late.
- Milestone 0 should mostly be completed now, but PR#60 is still open.
- Bruno encountered an error running the script yesterday.
- Found a similar Stackoverflow post related to the error.
- Created a function to check if the script is running on WSL and installed dos2unix on it.
- Added a check for sudo usage and provided a warning for root permission requirements.
- Edited the Readme file to remove sudo references.
- Committed the changes.

**10:12 AM - 11:33 AM (1 hour and 21 minutes)**

- Testing how things are working on the cloud for a fresh setup without Docker Compose.
- Everything works fine on a fresh system, but if Docker or Docker Compose is not installed, appropriate messages are displayed.

**11:33 AM - 12:01 PM (28 minutes)**

- Got a permission denied error while connecting to the Docker daemon socket.
- Solved it by running `sudo chmod 666 /var/run/docker.sock`.
- ended up not adding it in the PR.

**12:43 PM - 18:13 PM**

- Took a break a break.

**18:13 PM - 18:42 PM (29 minutes)**

- Resumed work.
- Two issues remaining in Milestone 0: #48 (dirty git work tree) and #55 (named volumes).

**18:42 PM - 20:20 PM (1 hour and 38 minutes)**

- Learned about .gitignore file.
- Added .gitignore file in a separate branch.
- Created PR#67 regarding restoring changes to docker-compose.yaml files instead of adding them to .gitignore.
- This should complete Milestone 0 if the PR merges successfully.

**20:20 PM - 21:02 PM (42 minutes)**

- Looking into Milestone 1 now.
- Created PR#68 that solves issue #62 by using `.tutorial_running.sh`.
- Bruno had an idea to solve issue #62, asked about it in the PR.

**21:02 PM - 23:44 PM (2 hours and 42 minutes)**

- Last task in the Maven milestone is #39, which will be worked on.
- Created PR#70 and verified it's working locally.
- Haven't checked on Gitpod yet.
- Also need to update the daily update.


### Date: 27/06/2023 TUESDAY

**Start Time:** 6:36 AM  
**End Time:** 23:01 PM  
**Hours Worked:** 10 hours 45 mins

## Summary:

- **6:36 AM - 8:16 AM (1 hour and 40 minutes)**
  - Found the Docker Compose official installation guide to implement in the scipt 
  - Developed a working script
  - test the init script on different setups using AWS cloud 

- **9:12 AM - 10:19 AM (1 hours and 7 minutes)**
  - Started testing the init script on Gitpod
  - Encountered an error related to the `./gitpodURL.sh` file not found


- **13:29 PM - 15:48 PM (2 hours and 19 minutes)**
  - Resumed work on resolving the Gitpod error
  - Decided that the Gitpod URL PR merge eliminates the need for the Gitpod-specific part
  - Encountered an error while installing Docker in the AWS instance: `Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?`
  - Skipped Docker installation due to multiple errors

- **15:48 PM - 17:21 PM (1 hour and 33 minutes)**
  - Improved on the teardown script, from brute force approach (docker compose down everything)
  - Completed the teardown.sh script, tested and verified it on the local machine

- **17:21 PM - 19:43 PM (2 hours and 22 minutes)**
  - Added more comments to the teardown script before pushing to GitHub
  - Fixed an error where the script was only removing one tutorial when multiple tutorials were started by adding a while loop
  - Created a function for SSH key handling and resolved an issue with root directory files by using absolute paths

- **19:43 PM - 20:00 PM (17 minutes)**
  - Tested the changes on Gitpod, confirmed they work fine
  - Created PR#60 for the changes
  - Created a Gitpod proxy issue #61 for future reference

- **20:30 PM - 21:30 PM (1 hour)**
  - Attended GSoc Group Meet: Contributor Evaluations with GSoC admin

- **22:34 PM - 23:01 PM (27 minutes)**
  - Completed the README update and commited the changes


### Date: 26/06/2023 MONDAY

**Start Time:** 6:35 AM  
**End Time:** 22:30 PM  
**Hours Worked:** 8h40m

## Summary:

- **6:35 AM - 7:45 AM (1 hours and 10 minutes)**
  - Worked on Maven tutorial
  - Custom agent Dockerfile with help with Bruno's version
  - Created feature/maven_tutorial branch

- **9:49 AM - 10:44 AM (55 minutes)**
  - Created an updated Readme file for the 03_maven_tutorial directory

- **11:00 AM - 11:36 AM (36 minutes)**
  - Investigated and resolved permission error with yq command in Gitpod environment

- **13:11 PM - 13:21 PM (10 minutes)**
  - Created and pushed PR#54 from the branch bug/gitpod_url

- **13:30 PM - 15:15 PM (1 hour and 45 minutes)**
  - Attended the weekly meeting and discussed key points

- **17:02 PM - 19:18 PM (2 hours and 16 minutes)**
  - Worked on creating the `jenkins_init` and `jenkins_teardown` scripts
  - Added initial draft of the scripts and planned further improvements
  - Took a break for dinner

- **20:18 PM - 22:05 PM (1 hour and 47 minutes)**
  - Continued working on the scripts, implementing functions



### Date: 25/06/2023 SUNDAY

Time: 7:17

Okay, Bruno created another draft PR named Maven Second Step #53. I do think Bruno is doing too much of the work on this. I’ll complete the tutorial today.

- Fork and clone the sample repository.
    - Useful for user’s first experience? Not so much. I tested Bruno’s script and was getting a failed with error:
        ```
        #7 0.969 error validating token: HTTP 401: Bad credentials (https://api.github.com/)
        #7 0.969 Try authenticating with: gh auth login
        ```
        But it works fine with personal access token with `repo` and `read:org` permissions.
- Create your Pipeline project in Jenkins.
    - Useful for user’s first experience? YES, and can be done with current setup with Bruno’s script.
- Create your initial Pipeline as a Jenkinsfile.
    - Useful for user’s first experience? YES, but uses Docker in Docker right now which can be solved by using a custom agent image that already has `mvn` installed on it. And Bruno also shared things related to this in dPR #53. I am making custom image and testing with it right now. And since the solution of importing the simple-java-maven-app to the controller as the repo URL, but since we are building everything on the agent instead, we also need the files in it in the agent. We can use real link of users repo so that agent can take files from forked repo of user and user can push changes to repo while building Jenkinsfile step by step (since we are already making user commit changes one more step is needed `git push origin master`) then agent will be able to get pom files and Jenkinsfile.
    - I am testing it right now.
- Add test stage to your Pipeline.
    - Useful for user’s first experience? Yes, 	this will be similar to the above step user will edit Jenkinsfile with Test stage and push the changes and then build with 3 steps
- Add final deliver stage to your Pipeline.
    - Useful for user’s first experience? Yes, the Same process can be repeated from above

Okay, I’ve tested it. Everything is working nicely. I am taking a break right now. Will test all other tutorials too afterward.

Time: 18:09

Trying things with current examples in Node.js and Python example.

Getting errors in both of them, especially Python example because it uses Docker a lot more than other examples.

Not able to connect to localhost:3000 in Node.js example.

For Python part, getting errors in deliver section of Jenkinsfile while running it on agent because it uses Docker to do most.

Will solve this tomorrow.

For things to do first thing tomorrow is to complete Maven tutorial and work on js tutorial should not be that hard and solve below issue with current example.

I do realize that I didn’t maintain that good of notes today with timestamps and time management was not that good today, got distracted a lot.

### Date: 24/06/2023 SATURDAY

Time: 6:55

Okay, let’s see what happened yesterday after I left and other important things.

UI docs PR #37 got merged, that checks one box out of the task list.

New-keygen PR #42 also got merged, but two new issues are created from it: issue #47 and #48.

emptyURL PR #36 also got merged, but issue #50 is created from it.

I also got a mail from Alyssa with an invite to add slides to the deck for the midterm presentation.

Jmm suggested pausing issue #38 multi-branch tutorial because of its heavy reliance on Blue Ocean and working on Maven Tutorial Issue #39 first, that adds one thing to the task list.

Jmm also shared some important tips:

- Create a summary of the tutorial's steps. Each step is described as a single sentence (if needed with the source line number to find full details).
- Evaluate what is the tooling required to perform the step.
- Is the action useful for the first user's experience?
    - YES => Can it be done with the current quickstart setup? Otherwise, add the required pre-requisite.
    - NO => Must be part of the quickstart automated configuration.
- Write the target/ideal flow of user interactions to perform the tutorial (aim to validate that nothing was forgotten and that it is usable).
- List the tooling and setup automation items required to perform the ideal tutorial flow.
- Pro tip: make sure that you run the tutorial's steps to have a full and practical understanding of each one. You can use your latest experimental configuration.

Jmm opened issue #42 in which he says that Compose file can’t be started before keygen.sh (but I think I solved this issue yesterday with using long-form volume section, I’ll check it again. Okay, I checked it’s working fine both locally and on Gitpod, but I did encounter yq permission error with gitpodURL.sh again (should add that to task list). I’ve replied to Jmm on GitHub regarding this).

Another Issue #48 opened by Jmm which says `When key generation script is executed, Compose file and keys are seen as git changes (dirty git worktree)`. I don’t know much about dirty git worktree, so I’ll learn about this too and add this to task list.

Another is Issue #49 which says to create `jenkins_quickstart_up.sh` and `jenkins_quickstart_down.sh` as previously stated by Jmm.

Another is Issue #50 with same issue about gitpodURL.sh I discussed above.

Another is Issue #51 which says to `move out of experiment directories`.

Last thing is draft PR #52 created by Bruno in which Bruno created a script for first part of Maven tutorial and helps with second step too (I’ll be working on this firstly today. Jmm also said this on Gitter “work on my proposal in Maven tutorial issue (list required items to be implemented). And create many issues (one per item to be done)”).

It’s 8:31 right now. I’ll be taking a break now.

Time: 17:08

Creating a Summary of Maven Tutorial step (reading Maven tutorial in detail):

- Fork and clone sample repository.
- Add final deliver stage to your Pipeline. Bruno already created script regarding this in draft PR #52. I am testing it right now on my local setup with new and old example.
- Create your Pipeline project in Jenkins.
- Create your initial Pipeline as a Jenkinsfile.
- Add test stage to your Pipeline.
- Add final deliver stage to your Pipeline.

Oh, and I didn’t use GitHub CLI before so might as well learn that now.

Okay, I saw a video about it and know basics now (it’s pretty cool), will try to use it in future and learn more about it. And also watched Git for Professionals video shared by Bruno too.

Didn’t do much work today. Will compensate for it tomorrow.

Task List:

- [ ] Work on dPR #52 Maven Tutorial.
- [ ] Resolve Issue #39 Maven Tutorial.
- [ ] Learn about dirty git worktree and resolve Issue #48.
- [ ] Resolve Issue #49 Jenkins startup and teardown scripts.
- [ ] Resolve yq permission error Issue #50.
- [ ] Resolves Issue #51 move out experiment.
- [ ] Propose set of other examples to implement (Issue #20) (from previous task list).
- [ ] Create an “epic” that lists all issues related to existing examples we should try to replicate.
- [ ] should focus on demo I’ll do on 6th of July, mostly about first persona.
- [ ] Create a document to prepare layout for presentation and share it with mentors so we can brainstorm asynchronously (think bullet points)
- [x] Complete PR#37 docs of UI
- [x] Complete PR#36 empty_url


### Date: 23/06/2023 FRIDAY

Start: 6:30, End: 20:25
Hours worked: 12:45

- 6:30 - 7:00 (30') 
   - daily log PR merge and Git conflicts
- 7:00 - 7:30 (30') 
   - review mentor's comments on the 3 ongoing PRs
- 7:30 - 8:30 (60')
   - learn about bash error flags
   - learn about SED on Mac and workout a solution
- 8:30 - 9:00 (30')
   - attend Doc Office Hour
- 9:50 - 12:35 (2:45)
   - solve issue on PR 42 (failures when compose is run before the initialisation script)
   - (git) sort out merge conflict !!
- 13:00 - 20:30 (?) (7:30)
   - work to fix issues on PR #37
   - work to fix issues on PR #36
   - listen to office hours recording
   - PR fixing
   - note keeping

Task List:

- [x] Complete PR #42 ssh_key_gen.
- [ ] Complete PR #37 docs of UI.
- [ ] Complete PR #36 empty_url.
- [ ] Propose a set of other examples to implement (Issue #20) (from previous task list).
- [ ] Create an “epic” that lists all issues related to existing examples we should try to replicate.
- [ ] Should focus on demo I’ll do on 6th of July, mostly about first persona.
- [ ] Create a document to prepare layout for presentation and share it with mentors so we can brainstorm asynchronously (think bullet points).

Things to Remember:

- Good practice: have "fail fast" bash error flagging in bash script with `set -euxo pipefail`.
- Mention everything in PR even things you read online which could save mentors time (like sed command in Mac and Ubuntu example).


### Date: 22/06/2023 THURSDAY

Okay, I think I’ve wrapped my head around PR #27 and Bervianto’s experiments and how the plugin installation manager tool works with this command Bruno gave: `jenkins-plugin-cli --plugin-file /usr/share/jenkins/plugins.txt --no-download --available-updates --output txt` 
But I am still not sure how to implement it. For this, I’ve asked mentors on GitHub issue #27.

For PR #24, Jmm suggested changing the title of the job to `(simple) demo job`, so I’ve done that and made the commit. He also suggested starting the sample pipeline every two minutes, and he also provided the `config.xml` file for it, from which I’ve learned about [cron](https://www.jenkins.io/doc/book/pipeline/syntax/#cron-syntax), and I’ve created a commit with the necessary changes.

And Bruno explained with a new issue how we’ll deal with the update problem with the plugin installation manager tool and created issue #45. And another one in which he says to shift the keygen to the Dockerfile too, in which I have a doubt about how I’ll transfer the public key from the build process to the Docker Compose file, which I’ll ask mentors after running some tests and examples later.

Another thing is to add new issues to the task list.

Attended one-to-one meeting with Bruno and Jmm, and they suggested during the meeting that I note the time I am working at too so make myself more productive.

From tommorow the daily update file will be uploded at the night(IST) when my work is done and not at any random time. And time stamps will also be recorded at what time what I am working on to increase productivity and accountibility. 
Also I'll be working on a fixed schedule from tommorow to avoid working late at night and keep the DailyUpdate.md updated before the day ends

Task List:

- [x] Watch Previous Year's midterm presentation for learning how to present 
- [x] Work on PR #24 from mentor’s feedback (get PR #24 merged)
- [x] Work on draft PR #27.
- [x] One to One Meet
- [ ] Complete PR #36 empty_url.
- [ ] Propose a set of other examples to implement (Issue #20)
- [ ] Create an “epic” that lists all issues related to existing examples we should try to replicate.
- [ ] Should focus on demo I’ll do on 6th of July, mostly about first persona.
- [ ] Create a document to prepare layout for presentation and share it with mentors so we can brainstorm asynchronously (think bullet points).


### Date: 21/06/2023 WEDNESDAY

Okay, I’ve created the Issues for all four of the documentation to discuss how we’ll do that part, and I am feeling quite hot here. Watched previous year’s midterm presentations, Dheeraj was in that too!

Okay, I was working on the ssh keygen issue #32 for some time now and have created PR #42 for it with `feature/new_key_gen` name. I did face some issues making it work with Gitpod since I’ve created it locally first, and I’ve found that GitHub deletes empty directories in it by default for some reason?

Anyway, let’s wait for mentor feedback on #42. Meanwhile, I’ll work on the next issue which is the URL one.

As Jmm suggested on PR #36 messages, I tried to run this on my local machine with just localhost in the URL but it was giving me a reverse proxy error which it didn’t give before (though it did show that error on Gitpod before too). So, I’ve tried to run the configuration wizard and it does solve the warning problem on Gitpod but reverse proxy still persists on Gitpod. On the other hand, my local machine is taking forever to build the Docker image now after I’ve added the configuration wizard to the image for some reason (it’s 850 seconds now). Since it was taking so long, I’ve canceled it and am using a Docker build command now.

Okay, something is wrong. When I run it with `RUN echo "2.0" > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state`, it runs just fine in like 10 seconds. But when I run it without it, it just never finishes. It won’t run even if I change the name of the file a bit. Okay, I’ve asked about this on GitHub now.

Task List:

- [ ] Complete PR #36 empty_url.
- [ ] Work on PR #24 from mentor’s feedback (get PR #24 merged) (from previous task list).
- [ ] Propose a set of other examples to implement (Issue #20) (from previous task list).
- [ ] Create an “epic” that lists all issues related to existing examples we should try to replicate.
- [ ] Should focus on demo I’ll do on 6th of July, mostly about first persona.
- [ ] Create a document to prepare layout for presentation and share it with mentors so we can brainstorm asynchronously (think bullet points).
- [x] Work on Issue #32 ssh keygen.
- [x] Complete PR #29 (Issue #25 - Restart on failure).
- [x] Should create one issue per documentation part we’re trying to replicate.

### Date: 20/06/2023 TUESDAY

Okay, a lot of work to do today, since yesterday was not so productive. I have a lot of things on my task list from yesterday, and for today, I have three new issues.

The first one is created by Bruno, issue #31, in which he says that `jenkins.yaml` (JCasC file) should be copied to `/usr/share/jenkins/ref` instead of `/var/jenkins_home`. But I read on the JCasC docs that the default location is `$JENKINS_HOME/jenkins.yaml`, so I’ve asked Bruno about the issue on GitHub. So this is the first today’s issue on the task list.

Jmm also opened some issues today. The first of which is Issue #32, in which he suggests adding a mechanism to generate new ssh keys at installation before the `docker-compose up` command.

The second is Issue #33, which says to explain how to connect to the UI.

The third is Issue #34, which says to remove the configuration warning hostname.

Okay, I’ve created PR #35 which solves issue #31 created by Bruno and asked the question about why it’s working without env variable CASC even without default value i.e., `/usr/share/jenkins/ref/`.

Now, since there are a lot of things left to do and I don’t feel I’ve worked enough today (slept in the afternoon too), I’ve decided to work late today.

I’ve spent a long time looking into Issue #34, in which I first tried `http://localhost:8080` as the Jenkins URL but it didn’t work as Jenkins said “Please set a valid hostname, instead of localhost”. By searching on the internet, I came around `JenkinsLocationConfiguration.xml` file but didn’t completely understand how it works. Do I put controller container name?

I set it in the UI and then saw it on the JCasC in that instance and it shows it like this:

```
unclassified: gitHubPluginConfig: hookUrl: “http://02_custom_docker_file_connecting_agent_and_controller-jenkins_controller:8080/jenkins/github-webhook/” location: adminAddress: “address not configured yet nobody@nowhere” url: “http://02_custom_docker_file_connecting_agent_and_controller-jenkins_controller:8080/jenkins/”
```

Regarding this, I’ve asked Jmm what should I put in the URL and created PR #36. So, I am crossing issue and making a new one as completing PR and waiting for mentors' response on this topic.

Now I am working on Issue #33, in which I am creating a new branch `docs/explain_ui`.

Okay, I’ve created PR #37 for the issue pinging mentors.

Task List:

- [ ] Work on Issue #32 ssh keygen.
- [x] Work on Issue #33 explain how to connect to UI.
- [x] Work on Issue #34 remove configuration warning.
- [ ] Complete PR #36 empty_url.
- [x] Jenkins.yaml should be copied in `/usr/share/jenkins/ref/` issue #31 (by Bruno).
- [ ] Propose a set of other examples to implement (Issue #20) (from previous task list).
- [ ] Work on PR #24 from mentor’s feedback (get PR #24 merged) (from previous task list).
- [ ] Complete PR #29 (Issue #25 - Restart on failure).
- [ ] Create an “epic” that lists all issues related to existing examples we should try to replicate.
- [ ] Should create one issue per documentation part we’re trying to replicate.
- [ ] Should focus on demo I’ll do on 6th of July, mostly about first persona.
- [ ] Create a document to prepare layout for presentation and share it with mentors so we can brainstorm asynchronously (think bullet points).

Things to remember:

The `/usr/share/jenkins/ref` directory serves as the base directory from which Jenkins copies everything to other locations. It is considered the official source of truth. Interestingly, it is often referenced in official documentation without explicitly explaining its significance.

### Date: 19/06/2023 MONDAY

As Jmm recommended adding some time for the job to complete for the user to see the progress, I thought maybe adding the sleep command for about 3-4 seconds before the actual command will let the user view it and won’t consume any extra resources either. I’ve asked Jmm on GitHub, let’s see what his reply is.

For Issue #25, I’ve created a separate branch named `bugfix/controller-restart` and created a PR with suitable changes that restarts the controller after restart or failure. I’ve added `restart: on-failure` to the Docker Compose file in the 02 example and also renamed the `+` in the 01 example to `plus` as Bruno mentioned in our one-to-one meeting.

Now, the two things remaining to work on right now are Issue #20 and doing something about the draft PR #27 created by Bruno.

Bervianto suggested adding the restart on failure option to the 01 example as well in Issue #25, and I added it.

Attended the weekly office hours with Bruno, Jmm, and Bervianto. Details of which can be found [here](https://docs.google.com/document/d/1yij9OvM2_92My3vqjn6u8ABHjXcyy0a7O6oM30b6ctM/edit#).

I have new tasks which we have discussed during office hours which I am adding to the the Tasklist will help me complete all the tast from the meeting notes 

Task List:

- [ ] Propose a set of other examples to implement (Issue #20) (from previous task list).
- [ ] Work on PR #24 from mentor’s feedback (get PR #24 merged) (from previous task list).
- [ ] Complete PR #29 (Issue #25 - Restart on failure).
- [ ] Create an “epic” that lists all issues related to existing examples we should try to replicate.
- [ ] should create one issue per documentation part we’re trying to replicate.
- [ ] should focus on demo I’ll do on 6th of July, mostly about first persona.
- [ ] Create a document to prepare layout for presentation and share it with mentors so we can brainstorm asynchronously (think bullet points).
- [ ] Have a look as shm_size 

### Date: 18/06/2023 SUNDAY
Weekend
### Date: 17/06/2023 SATURDAY
Weekend
### Date: 16/06/2023 FRIDAY
Was travelling 
### Date: 16/06/2023 FRIDAY
Task List: 
- [ ] Propose a set of other examples to implement (Issue #20).(From yesterday's tasklist)
- [ ] Work on PR #24 from mentor’s feedback (get PR #24 merged).(From yesterday's tasklist)
- [ ] Remove + from the 01 examples name
- [ ] Read this [article](https://www.jenkins.io/blog/2022/05/27/docker-image-new-lifecycle/) 
### Date: 15/06/2023 THURSDAY
Okay, I slept a little too early yesterday and scheduled the doddle requested by bruno for the wrong time. I’ve messaged bruno that I am sorry and created the correct doodle, hopefully we should be able to have our one on one meeting today
On SeperateReadme PR, Jmm suggested to rename docker compose files from 00_docker-compose.yaml and 01_docker-compose.yaml to just docker-compose file, so we won’t need to use -f option in the command and it’s also not mentioned in the docs I provided in the PR. So the first task is to rename these files to docker-compose.yaml. Ok I’ve renamed the files and committed the changes with the conventional commit approach as bruno mentioned to use that in a issue he opened i.e. issue #17. Bruno also opened an issue #21 regarded this which I have linked to the PR and should auto close once the PR is merged 
On Dockerfile PR #14 now named “feature(example): Now builds a Docker image thanks to a local Dockerfile” by bruno (I should remember to name my PRs like this in future) and I am thinking to add a things to remember section in this daily update so that, I can read the important stuff easily, now other task is to add the credentials to the docs. OK I’ve added the credentials to the docs and made the commit with conventional commit approach, Jmm also mentioned to add the clean up instruction in the README files, since named volumes don’t go away with just docker compose down, which I forget to read and before and submitted PR for re-review(Remember to not do it agan) 
Bruno also opened some other issues:
First is to use the Conventional commit approach #17 I’ll paste the message from bruno here to remember is for future 
“The "Conventional Commits" approach suggests using specific prefixes in commit messages to convey the nature of the changes made. Here are the common prefixes used:
feat: Used for new features or enhancements.
fix: Used for bug fixes.
chore: Used for maintenance tasks, build processes or other non-user-facing changes.
docs: Used for documentation-related changes.
style: Used for code style changes (e.g., formatting, indentation).
refactor: Used for code refactoring, without adding new features or fixing bugs.
test: Used for adding or modifying tests.
perf: Used for performance-related improvements.
build: Used for changes related to the build system or external dependencies.
ci: Used for changes to the continuous integration (CI) configuration or scripts.
Using these prefixes helps provide a clear and standardized way to categorize and understand the purpose of each commit.
It improves the readability and maintainability of commit history, making it easier for others (including your future self) to comprehend the changes made in the codebase. It's important to note that while the Conventional Commits approach is widely used and considered good practice, it's not mandatory. The key is to write descriptive and meaningful commit messages that accurately convey the purpose and impact of each commit.”

I asked Bruno for a convention in naming branches, and he replied with this:

Copy
When it comes to naming branches, there are a few conventions and best practices that can help make your branch names more descriptive and organized. It greatly varies depending on the project, and I’m not sure it’s clearly defined for the Jenkins project. Anyway, here are some common guidelines:

Use descriptive names: Choose branch names that clearly describe the purpose or goal of the branch. A well-named branch makes it easier for others (including your future self) to understand its purpose.
Use hyphens or underscores: Separate words in the branch name using hyphens (“-”) or underscores (“_”) to improve readability. For example, feature/new-feature or bugfix/issue-123.
Prefix with a category: Consider prefixing your branch names with a category or type to indicate the nature of the changes. Some commonly used prefixes include:
feature/: Used for new feature development.
bugfix/: Used for bug fixes.
hotfix/: Used for critical bug fixes in production.
refactor/: Used for refactoring code without adding new features or fixing bugs.
chore/: Used for maintenance tasks or non-user-facing changes.
docs/: Used for documentation-related changes.
test/: Used for adding or modifying tests.
Include a reference ID (optional): As we’re using GitHub’s issues, you may consider including an issue number in the branch name to associate it with a specific task or issue. For example, feature/issue-123.
Keep it concise: Aim for concise branch names that convey the necessary information without being too lengthy. Long branch names can be cumbersome to work with.
Here’s an example that combines these conventions:

feature/add-login-functionality
bugfix/fix-navigation-bug
refactor/restructure-database-schema
chore/update-dependencies
docs/update-readme
test/add-unit-tests
Remember, these conventions are not strict rules but rather guidelines to help maintain consistency and clarity within this project. I even can’t promise I will follow these rules every time.


The second issue is to create a working “One Job” example which Bruno opened in #18, which I’ll add to today’s work list.

The third issue Bruno opened is to get rid of the subdirectories for the daily journal, this is Issue #19. Which I’ll add to today’s work list too. For this, Bruno also said to copy all the content from old files to DailyUpdate.md file then get rid of the subdirectories. For this, I’ll create a new branch DailyUpdate in which I’ll do all the updates from now on and also delete the subdirectories because I was just pushing to the main branch until now to update the DailyUpdate.md file. Okay, I’ve created the branch and opened a PR linking the issue and deleted the subdirectories and updated DailyUpdate.md with their content.

The last issue created by Bruno is Issue #20. In which he suggests thinking about some examples I would like to see, especially considering newcomers to Jenkins. He also gave some suggestions:

- Demonstrating the use of LDAP to store credentials
- Illustrating the use of PostgreSQL to store credentials
- Exploring the use of Docker in Docker or Docker on Docker to build Docker images
- Showcasing the utilization of DinD or DonD to execute pipelines with existing Docker images

He suggests thinking of examples in order that increase in complexity while still being accessible and approachable for newcomers.
For the Job part, I have created a new branch to work on named `feature/adding-job` (following convention). I pasted all the hello example I tested before in the 02 example and committed the changes to the branch, and when I ran it on Gitpod, it again gave me the error from before. The only change I made was adding `USER JENKINS` at the end of the Dockerfile, so that must be the reason that’s causing the error. From which I concluded that the Jenkins user does not have write permission for the jobs folder anymore. Therefore, the solution must be to give it permissions with the root user, so I added `RUN chown -R jenkins:jenkins /var/jenkins_home/jobs` under root user and it worked!


Now I have opened PR #24 Feature/adding job which closes issue #18. So, I am ticking issue #18 task and adding a new one which tells to work on PR #24 by the feedback provided by mentors, basically getting PR #24 merged.


Okay, now the only thing to work on is thinking of examples to implement until mentors give suggestions on job PR #24.
Bruno suggested to remove the build directory from the PR because it's not necessary and I have deleted it 

PR #23 that was for the cleanup doc for 02 example has been merged 

Jmm has suggested to add some waits(calculation to increase time to finish) so that user is able to see the process when it's happening in the UI,
since He/She doesn't know where to look being new users, I'll work on it tomorrow 
Bruno also suggested to read this [article](https://www.jenkins.io/blog/2022/05/27/docker-image-new-lifecycle/) under the issue #25 and to remove the + from the name of the example since it's not compatible with all file system, on which I'll work tomorrow as well 


For today’s work include:


- [x] Complete the SeperateReadme PR, rename to `docker-compose.yaml`, solves Issue #21.
- [x] Added credentials to PR #14 and apologized for delay.
- [x] Add clean-up instructions in README files of examples. PR #24 and PR #16
- [x] Create a working "one job" example (Issue #18).
- [x] Get rid of subdirectories from daily journal (Issue #19).
- [ ] Propose a set of other examples to implement (Issue #20).(I'll add this for next day's task list )
- [ ] Work on PR #24 from mentor’s feedback (get PR #24 merged).(I'll add this for next day's task list)


Things to remember:


- Name your PRs like PR #14 as Bruno did so it’s easy for others to understand.
- Make your commits in the conventional commit approach so that it’s easy for others to understand like mentioned by Bruno in Issue #17.
- Make sure to name your branch according to convention.
- Not to submit PR for re-review before checking if there are multiple suggested changes.

### Date: 14/06/2023 WEDNESDAY

I’ve tried to transfer the jobs directory with Docker Compose instead of using the COPY command within the Dockerfile, and it worked fine without any errors. I used the the volume section of the docker compose file to do that.

Now I am testing if the error was happening because I was using the Jenkins user, so now I have changed the Jenkins user to root and am again doing it with the COPY command from the Dockerfile.

It worked!  
With the root user, so it was a permission issue, I guess. So, I guess I’ll ask my mentor if this job is fine and make a PR for it tomorrow.

Bruno suggested adding the credentials part of the 02 example to the README file, that is `admin`,`admin` for this example, and also for a one-to-one private meeting which we’ll have tomorrow.

- [x] The Persona PR #2 is merged.
- [x] The Gitpod Docs PR #15 is also merged.

Didn’t do much work today, will compensate for this tomorrow.



### Date: 13/06/2023 TUESDAY

I got a message from Bervianto that said to correct some typos and explain the setup in more detail, to make it easy for new people to the project to understand. Bruno did suggest the typos from the PR, from which I created the commits. But I created them separately, which I should have done in one single commit as Kris said to me before (remember not to do this again in the future).

I did make some more commits explaining the setup of Gitpod too and made a commit.

For Today’s Tasks, there are:

- [x] Complete the Persona PR. Bruno also mentioned it on GitHub today.
- [x] Create a separate README for each example.
- [x] Work on the Job part of the Jenkins setup.
- [x] Create special sub-directories Dockerfile as suggested by Jmm.
- [x] Store security-related stuff (e.g., the secret key) in its dedicated directory as suggested by Jmm.

First thing is to complete the Persona PR. I have added points in the Persona README to make things clear and also added a table as Bervianto suggested and committed to the PR with name ‘addingPointsAndTable’.

I also faced some issues while pushing things from Git from my terminal because I forgot to pull before adding a new commit, and I did make some changes to the file from GitHub itself. So, I had to use `git reset --soft HEAD~` command to solve the problem, which is a nice learning (try to remember that for future and not to add things directly from GitHub, and if you do, do `git pull` first).

Now for creating separate READMEs for each example. I created separate READMEs for every example, first for 02 and added it in the #14 PR since it was not merged yet. And created a separate branch named ‘SeperateREADME’ for creating files for 00 and 01 examples, created the README.md files, and opened the PR. Okay, so that task is done.

For the next task, that is to create special subdirectories and store security-related stuff in secrets as suggested by Jmm. Instead of creating separate PRs for 1st and 2nd points of Jmm’s suggestion, I've added it in adding Dockerfile PR. Before I thought this was bigger but they were really short work, that’s why.
 
I did work on the Job part too I created a simple job named hello copied it from the controller container to my local machine with command `cp <containerId>:/file/path/within/container /host/path/target`  and it did work. But when I tried to place it inside the new image with docker image with `COPY` command and ran the container it gave this error before even starting the instance 

`jenkins.model.InvalidBuildsDir: ${ITEM_ROOTDIR}/builds does not exist and probably cannot be created
	at jenkins.model.Jenkins.checkRawBuildsDir(Jenkins.java:3403)
	at jenkins.model.Jenkins.loadConfig(Jenkins.java:3324)
Caused: java.io.IOException
	at jenkins.model.Jenkins.loadConfig(Jenkins.java:3328)
	at jenkins.model.Jenkins$12.run(Jenkins.java:3423)
	at org.jvnet.hudson.reactor.TaskGraphBuilder$TaskImpl.run(TaskGraphBuilder.java:177)
	at org.jvnet.hudson.reactor.Reactor.runTask(Reactor.java:305)
	at jenkins.model.Jenkins$5.runTask(Jenkins.java:1164)
	at org.jvnet.hudson.reactor.Reactor$2.run(Reactor.java:221)
	at org.jvnet.hudson.reactor.Reactor$Node.run(Reactor.java:120)
	at jenkins.security.ImpersonatingExecutorService$1.run(ImpersonatingExecutorService.java:68)
	at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
	at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
	at java.base/java.lang.Thread.run(Thread.java:829)
Caused: org.jvnet.hudson.reactor.ReactorException
	at org.jvnet.hudson.reactor.Reactor.execute(Reactor.java:290)
	at jenkins.InitReactorRunner.run(InitReactorRunner.java:49)
	at jenkins.model.Jenkins.executeReactor(Jenkins.java:1199)
	at jenkins.model.Jenkins.<init>(Jenkins.java:987)
	at hudson.model.Hudson.<init>(Hudson.java:86)
	at hudson.model.Hudson.<init>(Hudson.java:82)
	at hudson.WebAppMain$3.run(WebAppMain.java:247)
Caused: hudson.util.HudsonFailedToLoad
	at hudson.WebAppMain$3.run(WebAppMain.java:264)`

I'll look why did this error happen tomorrow and work more on the job part and work on the feedback from mentors from the submitted PRs

### DATE: 12/06/2023 MONDAY

As Jmm suggested, from today I'll keep a daily update/journal in a single file. First of all, today is June 12th, but it will be the 13th by the time I upload this since I am working late. Today I attended the weekly office hour and had a personal chat with Jmm as an org admin.

For the first piece of work today, I am solving issue #13 opened by Bervianto in which I need to add guidelines for using Gitpod for outside users. Bervianto suggested covering these topics:
- [x] How to set up the repo in Gitpod?
- [x] Steps to run example 01
- [x] How to verify Jenkins was installed?

These are the essential things so that people outside the project can interact or understand the project, but I can add other things as well if I want. For this, I am creating a separate branch named "GitpodDocs". I have created a section for the 'How to set up repo in Gitpod' part. Now for 'Steps to run example 01'. Okay, I did create things for the second part i.e. 'Steps to run example 01', now for the third part. Okay, the third part is complete and I am making a PR from the branch `GitPodDocs` which solves issue #13 (remember not to use the wrong keyword again). I've corrected some grammatical mistakes from the doc and pushed the changes and created a PR and Bruno has already seen it.

Now for the next task is to incorporate the feedback given by the mentors on PR #14 that I created to add a custom Dockerfile.
- [x] The first suggestion is from Bervianto to set back the user to Jenkins as mentioned [here](https://github.com/jenkinsci/docker#installing-more-tools) as a good practice. I'll remember that. Thanks @bervianto.
- [x] The second suggestion is also from Bervianto in which he tells me to disable the built-in agent through a property in JCasC file which will ensure that the agent is used to run the job. Thanks again @bervianto as this was the issue I was facing when running the job today. Jmm also says it's a very important practice.
- [x] The third suggestion is also from Bervianto to remove unused plugins from the plugin.txt file as they just waste resources right now.
- [ ] The fourth suggestion is from Jmm, actually Jmm gave 5 suggestions in a big paragraph which are:
    - [ ] Store all material required to build the custom Docker image in a special sub-directory (ex ./images/controller/ or ./dockerfiles/ or ./dockerfiles/controller/). Which I don't clearly understand by the example, I'll ask about it on the Gitter Channel.
    - [ ] Store security-related stuff (ex secret key) in its dedicated directory (I use ./secrets/).
    - [ ] Subject to discussion: importing JCasC configuration into image (Dockerfile) makes it very static (which can make sense). The alternative way would be to map a local directory (containing config files) into an adequate place in Jenkins filesystem. It will make it very easy to adapt configuration.
    - [ ] We need to discuss rational and implication for mounting named volume. The advantage is that (manual) modifications to configuration are persistent. But is this something we want to have? To restart system, it requires removing named volume (a docker-compose down is not sufficient).
    - [ ] I have a feeling that adding small note (aka readme.me) in each experiment would help people like me a lot. You could start by saying what demo does (or supposed to do), how to start it, how to tear it down.
- [x] Last suggestion for today is from Bervianto to use pinned version of each plugin in plugin.txt file. Bruno also agrees and says then we can use Dependabot later on.

Okay, I've done everything from Bervianto's suggestions and now that I read Jmm's suggestion again and got what he meant by first suggestion. I'll make PR for that tomorrow.

### Adding the previous daily update from before 12th 
### 06/06/23
* changed docker images tags from latest and lts to pinned version in docker compose file
### 05/06/23
* attended weekly project meeting 
### 02/06/23
* attended Docs Office hours, got mark's, Kris's and Meg's view on the future of the project
### 01/06/23
* attended weekly GSoC office hour 
### 29/05/23
* attended  weekly office hours today
* Refreshed the docker and docker compose concept 
* Read jenkins documentation 
* Created a simple docker compose file but it's not ready yet, will upload it tomorrow 
### 31/05/23
* created a simple docker file with a controller and a agent on github repo 
* got an error while setting up an agent as node for controller and spend a long time trying to fix it, got a suggestion to use different key types from Bervianto, will try it tommorow


