FROM centos:centos7
MAINTAINER Yuntaz <docker@yuntaz.com>
ENV LANG en_US.utf8
ENV TZ UTC
ENV SHELL "/bin/bash"
USER root
RUN systemctl mask firewalld  && \
	systemctl disable firewalld
RUN yum -q -y update 
RUN yum update tzdata 
RUN yum -q -y install openssl which sudo
RUN /usr/bin/curl -o /usr/local/bin/gosu -SL 'https://github.com/tianon/gosu/releases/download/1.1/gosu' 
RUN /bin/chmod +x /usr/local/bin/gosu 
RUN useradd -ms /bin/bash idol
RUN mkdir /opt/HewlettPackardEnterprise 
ADD http://downloads.yuntaz.com/coes/connectors.tar.gz /opt
RUN tar xzvf /opt/connectors.tar.gz --absolute-names  && \ 
	chown -R idol /opt/HewlettPackardEnterprise && \
	chgrp -R idol /opt/HewlettPackardEnterprise  && \ 
	ln -s /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/SMC/scripts/smc_service.sh smc_service
USER idol
WORKDIR /home/idol
RUN bash -c 'smc_service -a=start'
ENTRYPOINT ["/opt/HewlettPackardEnterprise/IDOLServer-11.4.0/docker-entrypoint.sh"]
ADD ./docker-entrypoint.sh /opt/HewlettPackardEnterprise/IDOLServer-11.4.0
EXPOSE 7025 7026 7027 7028 7029