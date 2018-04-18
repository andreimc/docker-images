FROM lusu777/truffle-ruby:1.0.0-rc1

RUN yum -y install sqlite-devel

RUN gem install rails

RUN RUBY_ENGINE=truffleruby rails new api-play --api
