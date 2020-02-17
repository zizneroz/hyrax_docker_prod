#!/bin/bash

#echo "Creating log folder"
#mkdir -p $APP_WORKDIR/log

# if [ "$RAILS_ENV" = "production" ]; then
#     # Verify all the production gems are installed
#     bundle check
# else
#     # install any missing development gems (as we can tweak the development container without rebuilding it)
#     bundle check || bundle install --without production
# fi

# wait for Solr and Fedora to come up
sleep 20s

## Run any pending migrations, if the database exists
## If not setup the database
#bundle exec rake db:exists && bundle exec rake db:migrate || bundle exec rake db:setup

#MYSQL=$(curl --silent --connect-timeout 45 colmex.mysql | grep "MYSQL")

# check that MySQL is running
(echo > /dev/tcp/colmex.mysql/3306) >/dev/null 2>&1
result=$?
if [[ $result -eq 0 ]]; then
    echo "MySQL is running..."
else 
    echo "ERROR: MySQL is not running..."
    exit 1
fi

# if  $(nc -z colmex.mysql) ; then
#     echo "Can connect into database"
# else 
#     echo "Connect database"
# fi

#Check that Redis is running
(echo > /dev/tcp/colmex.redis/6379) >/dev/null 2>&1
result=$?
if [[ $result -eq 0 ]]; then
    echo "Redis is running..."
else 
    echo "ERROR: Redis is not running..."
    exit 1
fi

# check that Solr is running
SOLR=$(curl --silent --connect-timeout 45 "http://${SOLR_HOST:-colmex.solr}:${SOLR_PORT:-8983}/solr/" | grep "Apache SOLR")
if [ -n "$SOLR" ] ; then
    echo "Solr is running..."
else
    echo "ERROR: Solr is not running"
    exit 1
fi

# check that Fedora is running
FEDORA=$(curl --silent --connect-timeout 45 "http://${FEDORA_HOST:-colmex.fcrepo}:${FEDORA_DOCKER_PORT:-8080}/" | grep "Fedora Commons Repository 4.0")
if [ -n "$FEDORA" ] ; then
    echo "Fedora is running..."
else
    echo "ERROR: Fedora is not running"
    exit 1
fi

rake RAILS_ENV=production db:create 
rake RAILS_ENV=production db:migrate 
rake RAILS_ENV=production db:seed 
#rake RAILS_ENV=production db:setup
rake RAILS_ENV=production assets:precompile
RAILS_ENV=production rake hyrax:default_admin_set:create
#rails generate active_fedora:noid:install

#bundle exec rails -c Role.create!(:name => "admin")
#rails console Role.create!(:name => "admin")
# echo "Setting up hyrax... (this can take a few minutes)"
# bundle exec rake ngdr:setup_hyrax["seed/setup.json"]

# # echo "--------- Starting Hyrax in $RAILS_ENV mode ---------"
rm -f /tmp/hyrax.pid
bundle exec rails server -e production --pid /tmp/hyrax.pid

bundle exec sidekiq -C config/sidekiq.yml -e production
