# The MIT License
#
#  Copyright (c) 2015-2017, CloudBees, Inc. and other Jenkins contributors
#
#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#  THE SOFTWARE.

FROM signiant/docker-slave:latest
MAINTAINER Signiant DevOps <devops@signiant.com>

# Install Java 7
ENV JAVA_VERSION 7u80

RUN wget --no-verbose --no-cookies --no-check-certificate \
  "https://s3.amazonaws.com/sig-oracle-jdk/jdk/jdk-$JAVA_VERSION-linux-x64.tar.gz" -O /tmp/jdk-7-linux-x64.tar.gz \
  && cd /tmp \
  && tar zxvf jdk-7-linux-x64.tar.gz \
  && rm -f /tmp/jdk-7-linux-x64.tar.gz \
  && mv -f /tmp/jdk1.7.0_80 /usr/local/java7 \
  && update-alternatives --install /usr/bin/javac javac /usr/local/java7/bin/javac 300000 \
  && update-alternatives --set javac /usr/local/java7/bin/javac
