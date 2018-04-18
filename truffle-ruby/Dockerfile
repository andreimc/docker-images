FROM lusu777/oraclelinux-llvm:slim-7

ARG GRAALVM_VERSION=graalvm-1.0.0-rc1 
ARG TRUFFLE_RUBY_URL=https://github.com/oracle/truffleruby/releases/download/vm-1.0.0-rc1/ruby-installable-linux-amd64.jar

ENV LANG=en_US.UTF-8 \
    JAVA_HOME=/usr/${GRAALVM_VERSION}/jdk \
    PATH=/usr/${GRAALVM_VERSION}/bin:$PATH

ADD ${GRAALVM_VERSION}.tar.gz /usr/

RUN yum -y install gcc libxml2 libxslt-devel openssl-devel clang && rm -rf /var/cache/yum && \
    alternatives --install /usr/bin/java  java  $JAVA_HOME/bin/java  20000 && \
    alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000 && \
    alternatives --install /usr/bin/jar   jar   $JAVA_HOME/bin/jar   20000 

RUN gu install -u ${TRUFFLE_RUBY_URL}

RUN echo 'gem: --no-rdoc --no-ri ' > /root/.gemrc  && \
    gem install bundler && \
    bundle config build.nokogiri --use-system-libraries


CMD ["ruby", "--version"]