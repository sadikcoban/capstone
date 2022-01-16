FROM ubuntu:latest

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main" > /etc/apt / sources.list.d / pgdg.list

RUN apt - get update && apt - get install - y python - software - properties software - properties - common postgresql - 9.6 postgresql - client - 9.6 postgresql - contrib - 9.6

RUN / etc / init.d / postgresql start && \
psql--command "CREATE USER postgres WITH SUPERUSER PASSWORD '123456';" && \
createdb - O root xenonstack

RUN echo "host  all	0.0.0.0/0  md5" >> /etc/postgresql / 9.6 / main / pg_hba.conf

RUN echo "listen_addresses='*'" >> /etc/postgresql / 9.6 / main / postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of databases
VOLUME ["/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.6/bin/postgres", "-D", "/var/lib/postgresql", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"]
