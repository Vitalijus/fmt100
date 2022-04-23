# syntax=docker/dockerfile:1
# Add Ruby image as a base
FROM ruby:2.7-alpine

# Set an environment variable to specify the Bundler version
ENV BUNDLER_VERSION=2.2.15

# Rollbar
ENV POST_SERVER_ITEM_ACCESS_TOKEN=4be1dc1dbce0449e875c1557ef959959

# Maintainer
LABEL maintainer="Vitalijus Desukas <vitalij.desuk@gmail.com>"

# Add the packages that you need to work with
RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python2 \
      tzdata \
      yarn

# Install the appropriate bundler version
RUN gem install bundler -v 2.0.2

# Set the working directory for the application on the container
WORKDIR /app

# Copy over your Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install the project gems
# This instruction checks that the gems are not already installed before installing them
RUN bundle check || bundle install

# To get started with the Javascript section of our Dockerfile,
# copy package.json and yarn.lock from your current project directory on the host to the container
COPY package.json yarn.lock ./

# Install the required packages with yarn install
RUN yarn install --check-files

# Copy over the rest of the application code
COPY . ./

# Executed every time the container starts.
CMD rails server -b 0.0.0.0
