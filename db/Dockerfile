FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 
RUN apt-get install -y sudo wget gnupg postgresql postgresql-contrib postgresql-server-dev-12
RUN groupadd postgresusers && usermod -aG postgresusers,sudo postgres
RUN pg_ctlcluster 12 main start && sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';" 
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "pg_ctlcluster 12 main start"]






