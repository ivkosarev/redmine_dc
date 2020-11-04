FROM postgres:9.4
COPY ./init.sql /docker-entrypoint-initdb.d/
RUN mkdir -p "$PGDATA" && chmod 700 "$PGDATA"
EXPOSE 5432







