#!/bin/bash
pg_ctlcluster 12 main start
groupadd postgresusers && usermod -aG postgresusers,sudo postgres
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';"