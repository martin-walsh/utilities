#!/bin/bash

alias sm-docker-login='echo "Logging in to Docker ECR - 278521702583" && $(aws ecr get-login --registry-id=278521702583 --region us-west-2)'