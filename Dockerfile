FROM ruby:2.7.1

LABEL maintainer "Fred McGroarty <fredmcgroarty@gmail.com>"

ENV LANG="C.UTF-8"
ENV RUBYGEMS_VERSION="3.1.2" \
    BUNDLER_VERSION="2.1.4" 

ENV BUNDLE_PATH="/bundle" \
    BUNDLE_BIN="/bundle/bin" \
    BUNDLE_APP_CONFIG="/bundle" \
    GEM_HOME="/bundle/global" \
    PATH="/bundle/bin:/bundle/global/bin:${PATH}" 

# Note: we still need Bundler 1.x because Bundler auto-switches to it when it encounters a Gemfile.lock with BUNDLED WITH 1.x
# https://github.com/alpinelab/docker-ruby-dev/blob/master/Dockerfile
RUN gem update --system ${RUBYGEMS_VERSION} \
 && gem install bundler:${BUNDLER_VERSION} \
 && gem install bundler:1.17.3

WORKDIR /app
