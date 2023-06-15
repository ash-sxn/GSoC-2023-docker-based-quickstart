# Daily Update
### Date: 14/06/2023 WEDNESDAY

I’ve tried to transfer the jobs directory with Docker Compose instead of using the COPY command within the Dockerfile, and it worked fine without any errors. I used the the volume section of the docker compose file to do that.

Now I am testing if the error was happening because I was using the Jenkins user, so now I have changed the Jenkins user to root and am again doing it with the COPY command from the Dockerfile.

It worked!  
With the root user, so it was a permission issue, I guess. So, I guess I’ll ask my mentor if this job is fine and make a PR for it tomorrow.

Bruno suggested adding the credentials part of the 02 example to the README file, that is `admin:admin` for this example, and also for a one-to-one private meeting which we’ll have tomorrow.

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
