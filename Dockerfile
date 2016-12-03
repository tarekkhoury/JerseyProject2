FROM glassfish:4.1-jdk8

MAINTAINER tarek khoury "tarekkhoury78@gmail.com"

COPY aot.war /
COPY start.sh /

EXPOSE 8080

ENTRYPOINT ["/start.sh"]
