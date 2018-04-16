#!/bin/bash

npm config set '//registry.npmjs.org/:_authToken' $NPM_TOKEN

exec "/usr/local/bin/jenkins-slave" "$@"