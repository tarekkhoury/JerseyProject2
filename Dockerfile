# Install packages, download and extract GlassFish
# Setup password file
# Enable DAS
RUN apk add --update wget unzip git

RUN wget $MAVEN_URL && \
   tar -xzvf $MAVEN_PKG && \
    rm -f  $MAVEN_PKG  &&\
    echo "--- Setup maven completee ---" && \
    echo "--- mvn -v ---" && \
     mvn -v


RUN    wget --no-check-certificate $GLASSFISH_URL && \
    unzip -o $GLASSFISH_PKG && \
    rm -f $GLASSFISH_PKG && \
    apk del wget unzip && \
    echo "--- Setup the password file ---" && \
    echo "AS_ADMIN_PASSWORD=" > /tmp/glassfishpwd && \
    echo "AS_ADMIN_NEWPASSWORD=${PASSWORD}" >> /tmp/glassfishpwd  && \
    echo "--- Enable DAS, change admin password, and secure admin access ---" && \
    asadmin --user=admin --passwordfile=/tmp/glassfishpwd change-admin-password --domain_name domain1 && \
    asadmin start-domain && \
    echo "AS_ADMIN_PASSWORD=${PASSWORD}" > /tmp/glassfishpwd && \
    asadmin --user=admin --passwordfile=/tmp/glassfishpwd enable-secure-admin && \
    git clone https://github.com/tarekkhoury/JerseyServices2.git /app/ && \
    cd /app && mvn clean install -Dmaven.test.skip=true && \
    asadmin --user=admin --passwordfile=/tmp/glassfishpwd deploy /app/target/JerseyServices2.war && \
    asadmin --user=admin stop-domain && \
    rm /tmp/glassfishpwd



# Install software
#RUN git clone https://github.com/tarekkhoury/JerseyServices2.git /app/
#RUN cd /app && mvn clean install

# Ports being exposed
EXPOSE 4848 8080 8181


# Start asadmin console and the domain
CMD ["asadmin", "start-domain", "-v"]


