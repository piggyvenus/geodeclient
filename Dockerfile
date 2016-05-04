FROM centos:7
MAINTAINER Shanna Chan <piggyvenus@gmail.com>


# download JDK 8
ENV	JAVA_HOME $HOME/jdk1.8.0_72

RUN	yum install -y wget which tar git \
	&& wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u72-b15/jdk-8u72-linux-x64.tar.gz" \
	&& tar xf jdk-8u72-linux-x64.tar.gz \
	&& rm -rf /jdk-8u72-linux-x64.tar.gz \
	&& rm -rf /jdk-8u72-linux-x64/lib/missioncontrol/* \
	&& rm -rf /jdk-8u72-linux-x64/lib/visualvm/* \
	&& rm -rf /usr/share/locale/* \
	&& yum remove -y perl \
	&& yum clean all

ENV PATH $PATH:$JAVA_HOME/bin
#ADD geodo rest client
RUN mkdir -p /geodeclient
ADD javaclient.tar /geodeclient/
