ARG IMAGE=store/intersystems/iris-aa-community:2020.3.0AA.331.0
ARG IMAGE=intersystemsdc/iris-aa-community:2020.3.0AA.331.0-zpm
ARG IMAGE=intersystemsdc/iris-ml-community:2020.3.0.302.0-zpm
FROM $IMAGE
LABEL maintainer="Thomas Dyar <Thomas.Dyar@intersystems.com>"

USER root
RUN mkdir /data \
	&& chown irisowner /data
USER irisowner

# copy files
COPY data /data
COPY src /data/src
COPY iris.script /tmp/iris.script

# load demo stuff
RUN iris start IRIS \
	&& iris session IRIS < /tmp/iris.script

USER root   

# Install Java 8 using apt-get from ubuntu repository
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;
	
# Fix certificate issues, found as of 
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Setup JAVA_HOME, to enable apps to know 
# where the Java was installed
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
ENV JRE_HOME /usr/lib/jvm/java-8-openjdk-amd64/
RUN export JRE_HOME

# Setup classpath, to enable apps to know 
# where java classes and java jar libraries was installed
ENV classpath .:/usr/irissys/dev/java/lib/JDK18/*:/jgw/*
RUN export classpath
ENV CLASSPATH .:/usr/irissys/dev/java/lib/JDK18/*:/jgw/*
RUN export CLASSPATH

COPY jgw /jgw

# COPY lib/interoperability-integratedml-adapter.jar /jgw/interoperability-integratedml-adapter.jar  

# COPY jgw/* /usr/irissys/dev/java/lib/JDK18/
