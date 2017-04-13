# docker-tomcat5
Docker image for tomcat 5 and java 6

Docker Hub Url: [https://hub.docker.com/r/sahirzm/tomcat5/](https://hub.docker.com/r/sahirzm/tomcat5/)

USAGE: docker run -p 8080:8080 -d sahirzm/tomcat5

To deploy war file:
visit DOCKER_URL:8080/manager/html or use maven plugin tomcat:deploy

To stop container:
docker stop <NAME>
