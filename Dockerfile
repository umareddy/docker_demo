From ubuntu:14.04
MAINTAINER Uma Reddy

RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN apt-get update
RUN apt-get install -y nginx

EXPOSE 22 80

USER root
ADD start.sh start.sh 
RUN chmod 777 start.sh

CMD ["sh", "start.sh"]
