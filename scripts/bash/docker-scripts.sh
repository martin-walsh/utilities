#!/usr/bin/env bash

alias sm-docker-login='echo "Logging in to Docker ECR - 278521702583" && $(aws ecr get-login --registry-id=278521702583 --region us-west-2 | sed "s/-e none//g")'

sm-describe-repos () {
	aws ecr describe-repositories --registry-id=278521702583 --repository-names=$1
}

sm-describe-images() {
	aws ecr describe-images --registry-id=278521702583 --repository-name $1
}
