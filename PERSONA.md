# Persona

## First Persona

This persona may have little or no knowledge about Docker Compose files or how they function.
They may not be interested in delving into the technical intricacies and simply want to use Jenkins without worrying about the setup process.
Although they may not have much familiarity with Jenkins at the moment, they are eager to explore its functionality, appearance, and user experience.
Their goal is to quickly and effortlessly start using Jenkins without investing significant time in setup and configuration.
To cater to this persona, fully automated `docker-compose` files and scripts are required, allowing them to set up Jenkins with a single command or by cloning a repository (similar to the Kubernetes part mentioned [here](https://www.jenkins.io/doc/book/installing/kubernetes/#jenkins-kubernetes-manifest-files)) before running `docker compose up`.

## Second Persona

This persona possesses a solid understanding of Docker and is keen on utilizing Docker Compose to customize their Jenkins setup.
They want to deepen their knowledge of how Docker and Jenkins integrate and are willing to invest time in understanding the technical aspects.
Their objective is to optimize their workflow and leverage the available tools to their fullest potential.
They desire greater control over their setup and are prepared to spend time tailoring it to align with their requirements.
This persona wants to have a clear understanding of the components running on their system before executing any commands.
The simple `docker-compose` files cater to their needs by providing transparency and facilitating their comprehension of how `docker compose` interacts with Jenkins.