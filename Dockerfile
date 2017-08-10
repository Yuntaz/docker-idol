FROM centos:centos7
MAINTAINER Yuntaz <docker@yuntaz.com>
ENV LANG en_US.utf8
ENV TZ UTC
ENV SHELL "/bin/bash"
USER root
WORKDIR /opt
# Disable Firewall
RUN systemctl mask firewalld  && \
	systemctl disable firewalld
# Update Centos7 and install packages for IDOL
RUN yum -q -y update 
RUN yum update tzdata 
RUN yum -q -y install openssl which sudo
# Add idol user and add it to the sudoers
RUN useradd -ms /bin/bash idol && \
    echo "idol ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/idol && \
    chmod 0440 /etc/sudoers.d/idol && \
	echo "idol:idol!" | chpasswd
# Download installation & uncompress it
ADD http://downloads.yuntaz.com/docker/idol_11.4.0.tar.gz /opt
RUN chmod 666 idol_11.4.0.tar.gz && \ 
	tar xzvf idol_11.4.0.tar.gz  && \
	chown -R idol:idol HewlettPackardEnterprise 
RUN rm -rf idol_11.4.0.tar.gz
# Add smc_service script as a command
WORKDIR /usr/bin
RUN	ln -s /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/SMC/scripts/smc_service.sh smc_service
# Add services to the systemctl
WORKDIR /etc/systemd/system
RUN cp /opt/HewlettPackardEnterprise/IDOLServer-11.4.0/scripts/init/systemd/ /etc/systemd/system && \
	chmod 666 *.service 
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
EXPOSE 7000 7025 7026 7027 7028 7029 9030 9050 9080 9100 