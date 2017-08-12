# HPE IDOL is a commercial software from Hewlett Packard Enterprise Development LP. 
# To run this docker image you will need a valid license from Hewlett Packard Enterprise.
# Here we don't provide a valid license. If you want to run it, please contact us as registerd partner from HPE at hi@yuntaz.com.
# Restricted Rights Legend: Confidential computer software. Valid license from HPE required for possession, use or copying. 
# Consistent with FAR 12.211 and 12.212, Commercial Computer Software, Computer Software Documentation, and
# Technical Data for Commercial Items are licensed to the U.S. Government under vendor's standard commercial license.
# Copyright Notice

FROM centos:centos7
MAINTAINER Yuntaz <docker@yuntaz.com>
ENV LANG en_US.utf8
ENV TZ UTC
ENV SHELL "/bin/bash"
ENV container docker

# Setting up ARG and ENV variables
ARG LICENSE_FILE_URL=http://downloads.yuntaz.com/docker/licensekey.dat
ENV LICENSE_FILE ${LICENSE_FILE_URL}

ARG IDOL_TAR_URL=http://downloads.yuntaz.com/docker/idol_11.4.0.tar.gz
ENV IDOL_TAR ${IDOL_TAR_URL}

USER root
WORKDIR /opt
# Install initialization script, which will execute kickstart scripts and  then will start systemd as pid 1.
RUN rpm -vi https://github.com/vlisivka/docker-centos7-systemd-unpriv/releases/download/v1.0/docker-centos7-systemd-unpriv-1.0-1.el7.centos.noarch.rpm

# Disable Firewall
RUN systemctl mask firewalld  && \
	systemctl disable firewalld
# Update Centos7 and install packages for IDOL
RUN yum -q -y update 
RUN yum update tzdata 
RUN yum install -y epel-release initscripts openssl which sudo bind bind-utils net-tools systemd
# Systemd
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); 
	rm -f /lib/systemd/system/multi-user.target.wants/*;
	rm -f /etc/systemd/system/*.wants/*;
	rm -f /lib/systemd/system/local-fs.target.wants/*; 
	rm -f /lib/systemd/system/sockets.target.wants/*udev*; 
	rm -f /lib/systemd/system/sockets.target.wants/*initctl*; 
	rm -f /lib/systemd/system/basic.target.wants/*;
	rm -f /lib/systemd/system/anaconda.target.wants/*;
# Add idol user and add it to the sudoers
RUN useradd -ms /bin/bash idol && \
    echo "idol ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/idol && \
    chmod 0440 /etc/sudoers.d/idol && \
	echo "idol:idol!" | chpasswd
# Download installation & uncompress it
RUN echo $IDOL_TAR
ADD $IDOL_TAR /opt
RUN chmod 666 idol_11.4.0.tar.gz && \ 
	tar xzvf idol_11.4.0.tar.gz  && \
	chown -R idol:idol HewlettPackardEnterprise 
RUN rm -rf idol_11.4.0.tar.gz
ADD ${LICENSE_FILE} /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/licenseserver/licensekey.dat
WORKDIR /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/licenseserver
RUN chown -R idol:idol * && \ 
	chmod 666 licensekey.dat
# Add smc_service script as a command
WORKDIR /usr/bin
RUN	ln -s /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/SMC/scripts/smc_service.sh smc_service
# Add services to the systemctl
WORKDIR /etc/systemd/system
RUN cp /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/scripts/init/systemd/*.service /etc/systemd/system && \
	chmod 664 *.service 
RUN	systemctl enable licenseserver.service && \
	systemctl enable content.service && \
	systemctl enable agentstore.service && \
	systemctl enable category.service && \
	systemctl enable community.service && \
	systemctl enable view.service && \
	systemctl enable statsserver.service && \
	systemctl enable controller.service && \
	systemctl enable coordinator.service && \
	systemctl enable filesystemconnector.service && \
	systemctl enable webconnector.service && \
	systemctl enable cfs.service
# Entrypoint
ENTRYPOINT ["/home/idol/docker-entrypoint.sh"]
ADD ./docker-entrypoint.sh /home/idol/
RUN chown -R idol:idol /home/idol && \
	chmod +x /home/idol/docker-entrypoint.sh
USER idol
WORKDIR /home/idol
# systemd
VOLUME [ “/sys/fs/cgroup” ]
CMD [“/usr/sbin/init”]
EXPOSE 7000 7025 7026 7027 7028 7029 9030 9050 9080 9100