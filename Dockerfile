FROM redis
MAINTAINER Joshua Rubin <jrubin@zvelo.com>
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update \
  && apt-get -y upgrade \
  && apt-get -y --no-install-recommends install ruby \
  && gem install redis \
  && apt-get -y autoremove \
  && apt-get -y clean
WORKDIR /usr/local/bin
ADD redis-trib.rb /usr/local/bin/redis-trib.rb
RUN chmod 755 /usr/local/bin/redis-trib.rb
ENTRYPOINT ["/usr/local/bin/redis-trib.rb"]
