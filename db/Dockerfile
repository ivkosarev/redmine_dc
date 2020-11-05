FROM postgres:10
RUN mkdir -p "$PGDATA" && chmod 700 "$PGDATA"
EXPOSE 5432
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
CMD ["-c", "pg_createcluster 10 redmine && pg_ctlcluster 10 redmine start && pg_lsclusters"]







