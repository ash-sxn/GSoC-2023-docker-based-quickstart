# Daily Update

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
