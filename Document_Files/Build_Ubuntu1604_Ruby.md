### Build Ubuntu Ruby
```
FROM ubuntu:16.04
MAINTAINER Piboonsak Pimsarn (Piboonsakhbs@gmail.com)
LABEL Description="ubuntu 16.04 and All_Ruby Build Container" Version="1.0"
RUN apt-get update && apt-get install -y \
        sudo \
        nano \
        wget \
        curl \
        htop \
        man
RUN sudo apt-get install -y iputils-ping
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io
RUN bash -s stable --ruby --rails --gems
RUN sudo apt-get install -y \
        software-properties-common
RUN sudo apt-add-repository -y ppa:rael-gc/rvm
RUN sudo apt-get update && apt-get install -y rvm
RUN rvm install ruby
RUN rvm list
RUN ruby -v
RUN gem -v
RUN rails -v
RUN undle -v
RUN mkdir -p /myapp
CMD bash
```

** Not finish stop on process RUN rvm install ruby Because need to restart server **
