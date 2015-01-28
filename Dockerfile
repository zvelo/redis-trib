FROM redis
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y install ruby \
  && gem install redis
WORKDIR /usr/local/bin
ADD redis-trib.rb /usr/local/bin/redis-trib.rb
ENTRYPOINT ["/usr/local/bin/redis-trib.rb"]
