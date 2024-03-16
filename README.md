# image-keycloak
Docker image for keycloak.

## Why
 - To add a docker healthcheck

## Changes
 - adds curl to image
 - configures keycloak to enable the health api
 - adds docker healthcheck 
 
## Notes
 - The healthcheck assumes keycloak's health path is at http://localhost:8080/health
