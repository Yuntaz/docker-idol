FROM centos:centos7
MAINTAINER Yuntaz <docker@yuntaz.com>
ENV LANG en_US.utf8
ENV TZ UTC
ENV SHELL "/bin/bash"
USER root
WORKDIR /opt
RUN systemctl mask firewalld  && \
	systemctl disable firewalld
RUN yum -q -y update 
RUN yum update tzdata 
RUN yum -q -y install openssl which sudo
RUN useradd -ms /bin/bash idol && \
    echo "idol ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/idol && \
    chmod 0440 /etc/sudoers.d/idol && \
	echo "idol:idol!" | chpasswd
ADD http://downloads.yuntaz.com/coes/connectors.tar.gz /opt
RUN chmod 666 connectors.tar.gz && \ 
	tar xzvf connectors.tar.gz  && \
	chown -R idol:idol HewlettPackardEnterprise 
WORKDIR /usr/bin
RUN	ln -s /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/SMC/scripts/smc_service.sh smc_service
ENTRYPOINT ["/home/idol/docker-entrypoint.sh"]
ADD ./docker-entrypoint.sh /home/idol/
RUN chown -R idol:idol /home/idol && \
	chmod +x /home/idol/docker-entrypoint.sh
USER idol
WORKDIR /home/idol
EXPOSE 7025 7026 7027 7028 7029