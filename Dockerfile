FROM ruby
RUN apt-get update -yqq
RUN apt-get install -yqq --no-install-recommends nodejs \
  libvips
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN bundle install
EXPOSE 3000
ENTRYPOINT [ "bin/rails" ]
CMD [ "s", "-b", "0.0.0.0" ]

