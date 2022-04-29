FROM ruby:3.1.1

# Register Yarn package source.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install additional packages.
RUN apt update -qq
RUN apt install -y build-essential libpq-dev

# Prepare working directory.
WORKDIR /app
COPY . .
RUN gem install bundler
RUN bundle install

# Configure endpoint.
EXPOSE 3000

# Start app server.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]