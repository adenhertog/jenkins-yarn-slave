# adenhertog/jenkins-yarn-slave

A Jenkins docker slave image that includes yarn and alpine-sdk, based off [jenkins/jnlp-slave](https://github.com/jenkinsci/docker-jnlp-slave).

This image is intended to be used with the [Amazon Ecs Plugin](https://wiki.jenkins.io/display/JENKINS/Amazon+EC2+Container+Service+Plugin) for Jenkins to run builds as ECS tasks for node-based projects.

## Private/Organisational Repositories

Private or organisation repositories are supported by injecting the npm authentication token as part of the `NPM_TOKEN` environment variable

For example:

> `docker run -e "NPM_TOKEN=<auth token>" adenhertog/jenkins-yarn-slave`
