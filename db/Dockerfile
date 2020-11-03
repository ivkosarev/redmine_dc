FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get install -y sudo gnupg postgresql postgresql-contrib
RUN psql --version
RUN groupadd postgresusers && usermod -aG postgresusers,sudo postgres
RUN pg_ctlcluster 12 main start && sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';" 
COPY ./pg_hba.conf /etc/postgresql/12/main
EXPOSE 5432
RUN  pg_createcluster 12 main
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "pg_ctlcluster 13 main start && service postgresql status"]






