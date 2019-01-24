#!/bin/bash

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

curl -sSL https://get.rvm.io | bash -s stable --ruby --rails --gems

apt-get install software-properties-common

apt-get update

apt-get install rvm

rvm install ruby

rvm list

ruby -v

rails -v

gem -v

bundle -v
