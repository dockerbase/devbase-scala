# VERSION 1.1
# DOCKER-VERSION  1.2.0
# AUTHOR:         Richard Lee <lifuzu@gmail.com>
# DESCRIPTION:    Devbase-scala Image Container

FROM dockerbase/devbase-jdk

ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

USER    root

# Information Of Package
ENV     PKG_ALIAS scala
ENV     PKG_VERSION scala-2.11.5
ENV     PKG_PACKAGE $PKG_VERSION.tgz
ENV     PKG_LINK http://downloads.typesafe.com/scala/2.11.5/$PKG_PACKAGE


# Intall scala
RUN     cd /tmp && \
        curl -O -L $PKG_LINK && \
        tar -zxf /tmp/$PKG_PACKAGE && \
        mv /tmp/$PKG_VERSION /usr/local/$PKG_VERSION && \
        ln -s /usr/local/$PKG_VERSION /usr/local/$PKG_ALIAS

ENV     SCALA_HOME /usr/local/$PKG_ALIAS
ENV     PATH $PATH:$SCALA_HOME/bin


# Information Of Package
# sbt - http://www.scala-sbt.org/
ENV     PKG_ALIAS sbt
ENV	PKG_VERSION sbt-0.13.7
ENV	PKG_PACKAGE sbt-0.13.7.tgz
ENV	PKG_LINK https://dl.bintray.com/sbt/native-packages/sbt/0.13.7/$PKG_PACKAGE

# Intall sbt
RUN     cd /tmp && \
        curl -O -L $PKG_LINK && \
        tar -zxf /tmp/$PKG_PACKAGE && \
        mv /tmp/sbt /usr/local/$PKG_VERSION && \
        ln -s /usr/local/$PKG_VERSION /usr/local/$PKG_ALIAS

ENV     SBT_HOME /usr/local/$PKG_ALIAS
ENV     PATH $PATH:$SBT_HOME/bin

# Run the build scripts
RUN     rm -rf /tmp/* /var/tmp/*

USER    devbase

# Set environment variables.
ENV     HOME /home/devbase

# Define working directory.
WORKDIR /home/devbase

# Define default command.
CMD ["bash"]
