FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs openjdk-8-jdk ghostscript ffmpeg imagemagick netcat
RUN mkdir /colmex_hyrax
WORKDIR /colmex_hyrax
ADD Gemfile /colmex_hyrax/Gemfile
RUN bundle install
#ADD Gemfile.lock /colmex_hyrax/Gemfile.lock
COPY ./docker-entrypoint.sh /bin/
RUN chmod +x /bin/docker-entrypoint.sh
#RUN rake db:create db:migrate
#RUN Role.create!(:name => "admin")
#RUN User.create!(email: "mail@domain.mx", password: "*******", password_confirmation: "******")
#RUN admin = Role.find(1)
#RUN admin.users << User.find_by_user_key("mail@domain.mx")
#RUN bin/rails hyrax:default_admin_set:create