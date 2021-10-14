FROM debian
RUN apt update
RUN apt install ssh wget npm -y
RUN  npm install -g wstunnel
RUN mkdir /run/sshd 
RUN echo 'Hello, Welcome on board!' >>/var/www/html/index.html
RUN echo 'wstunnel -s 0.0.0.0:9527 &' >>/163.sh
RUN echo '/usr/sbin/sshd -D' >>/163.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:Acs810606|chpasswd
RUN chmod 755 /163.sh
EXPOSE 80
CMD  /163.sh
