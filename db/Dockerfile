FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 
RUN apt-get install -y sudo wget gnupg postgresql postgresql-contrib postgresql-server-dev-12

COPY ./start_db.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/start_db.sh 
ENTRYPOINT ["bash"]
CMD ["-c", "/usr/local/bin/start_db.sh"]







