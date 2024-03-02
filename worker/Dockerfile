FROM ruby:3.2.2

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt update
run apt upgrade -y
run apt install lsb-base lsb-release 

#postgreSQL
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt update && apt install -y libpq-dev vim htop postgresql-15


ADD . /home/Kanban_ruby_on_rails/web
WORKDIR /home/Kanban_ruby_on_rails/web

RUN bundle install --jobs 5 --retry 5

COPY ./worker/entrypoint.sh /home/Kanban_ruby_on_rails/web/worker/entrypoint.sh
run chmod +x /home/Kanban_ruby_on_rails/web/worker/entrypoint.sh

CMD bash /home/Kanban_ruby_on_rails/web/worker/entrypoint.sh