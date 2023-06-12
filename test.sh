#!/bin/bash

docker build -t electionbuddy-challenge .
docker run --name electionbuddy-challenge -d electionbuddy-challenge
docker exec -it electionbuddy-challenge bin/rails test
docker stop electionbuddy-challenge
docker rm electionbuddy-challenge
