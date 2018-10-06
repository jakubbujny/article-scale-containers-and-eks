#!/usr/bin/env bash

./kubectl.sh apply -f deployment.yml

./kubectl.sh apply -f service-aws.yml

./kubectl.sh apply -f hpa.yml


