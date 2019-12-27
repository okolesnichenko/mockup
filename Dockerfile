FROM ruby:2.5.1-alpine

RUN mkdir /mockup \ 
	&& apk add --update --no-cache \
	&& gem install bundler \
	&& gem install rack \
	&& gem update --system  

ENV BUNDLER_VERSION=2.0.2
WORKDIR /mockup
ADD Gemfile /mockup/Gemfile
ADD Gemfile.lock /mockup/Gemfile.lock

COPY . /mockup

EXPOSE 9292
RUN bundle install
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "9292"]
