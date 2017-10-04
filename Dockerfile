FROM ruby:2.3.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash && apt-get install -y nodejs
RUN mkdir -p /app
WORKDIR /app
COPY . ./
ENV RAILS_ENV ${RAILS_ENV:-production}
RUN npm install
RUN npm run webpack
RUN gem install sigar -- --with-cppflags="-fgnu89-inline"
RUN if [ "$RAILS_ENV" = "production" ] ; then echo "production env" && gem install bundler && bundle install --without development test development_scraper ; else echo "non-production env" && gem install bundler && bundle install ; fi
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
