#!/bin/sh

docker build --tag ivcode/keycloak:latest .
docker tag ivcode/keycloak:latest ivcode/keycloak:23.0.3-SNAPSHOT
