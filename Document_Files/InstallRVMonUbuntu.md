## Install RVM on Ubuntu

root@fd56a54989bb:~# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
gpg: directory `/root/.gnupg' created

----------------------------------------------------------------------------------------
root@fd56a54989bb:~# curl -sSL https://get.rvm.io | bash -s stable --ruby --rails --gems

Usage

  rvm-installer [options] [action]

Options

----------------------------------------------------------------------------------------

root@fd56a54989bb:~# apt-get install software-properties-common
Reading package lists... Done



----------------------------------------------------------------------------------------
root@fd56a54989bb:~# apt-get update
root@fd56a54989bb:~# apt-get install rvm
Reading package lists... Done
Building dependency tree       
Reading state information... Done

root@docker105:~# docker container exec -ti ubuntu_STD /bin/bash
root@fd56a54989bb:/# rvm install ruby
Searching for binary rubies, this might take some time.
Found remote file https://rvm_io.global.ssl.fastly.net/binaries/ubuntu/16.04/x86_64/ruby-2.5.1.tar.bz2
Checking requirements for ubuntu.
Installing requirements for ubuntu.

----------------------------------------------------------------------------------------


rvm alias create default ruby-2.5.1
root@c00295c22cbf:~# rvm alias create default ruby-2.5.1
Creating alias default for ruby-2.5.1....


root@c00295c22cbf:~# rvm use ruby-2.5.1
Using /usr/share/rvm/gems/ruby-2.5.1


root@c00295c22cbf:~# ruby -v
ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]
root@c00295c22cbf:~# 

root@c00295c22cbf:~# gem -v
2.7.6

root@c00295c22cbf:~# irb
2.5.1 :001 >

root@c00295c22cbf:~# rvm gemdir
/usr/share/rvm/gems/ruby-2.5.1


root@c00295c22cbf:~# gem install bundler --no-rdoc --no-ri
Fetching: bundler-1.16.4.gem (100%)
Successfully installed bundler-1.16.4
1 gem installed

root@c00295c22cbf:~# bundler -v
Bundler version 1.16.4

apt-get install sudo
	
sudo apt-get install -y nodejs && sudo ln -sf /usr/bin/nodejs /usr/local/bin/node
root@c00295c22cbf:~# sudo apt-get install -y nodejs && sudo ln -sf /usr/bin/nodejs /usr/local/bin/node
Reading package lists... Done
Building dependency tree       
Reading state information... Done


root@c00295c22cbf:~# nodejs -v
v4.2.6
----------------------------------------------------------------------------------------

root@c00295c22cbf:~# sudo apt-get install -y git
Reading package lists... Done
Building dependency tree       
Reading state information... Done

----------------------------------------------------------------------------------------

root@c00295c22cbf:~# gem search '^rails$' --all

*** REMOTE GEMS ***

rails (5.2.1, 5.2.0, 5.1.6, 5.1.5, 5.1.4, 5.1.3, 5.1.2, 5.1.1, 5.1.0, 5.0.7, 5.0.6, 5.0.5, 5.0.4, 5.0.3, 5.0.2, 5.0.1, 5.0.0.1, 5.0.0, 4.2.10, 4.2.9, 4.2.8, 4.2.7.1, 4.2.7, 4.2.6, 4.2.5.2, 4.2.5.1, 4.2.5, 4.2.4, 4.2.3, 4.2.2, 4.2.1, 4.2.0, 4.1.16, 4.1.15, 4.1.14.2, 4.1.14.1, 4.1.14, 4.1.13, 4.1.12, 4.1.11, 4.1.10, 4.1.9, 4.1.8, 4.1.7.1, 4.1.7, 4.1.6, 4.1.5, 4.1.4, 4.1.3, 4.1.2, 4.1.1, 4.1.0, 4.0.13, 4.0.12, 4.0.11.1, 4.0.11, 4.0.10, 4.0.9, 4.0.8, 4.0.7, 4.0.6, 4.0.5, 4.0.4, 4.0.3, 4.0.2, 4.0.1, 4.0.0, 3.2.22.5, 3.2.22.4, 3.2.22.3, 3.2.22.2, 3.2.22.1, 3.2.22, 3.2.21, 3.2.20, 3.2.19, 3.2.18, 3.2.17, 3.2.16, 3.2.15, 3.2.14, 3.2.13, 3.2.12, 3.2.11, 3.2.10, 3.2.9, 3.2.8, 3.2.7, 3.2.6, 3.2.5, 3.2.4, 3.2.3, 3.2.2, 3.2.1, 3.2.0, 3.1.12, 3.1.11, 3.1.10, 3.1.9, 3.1.8, 3.1.7, 3.1.6, 3.1.5, 3.1.4, 3.1.3, 3.1.2, 3.1.1, 3.1.0, 3.0.20, 3.0.19, 3.0.18, 3.0.17, 3.0.16, 3.0.15, 3.0.14, 3.0.13, 3.0.12, 3.0.11, 3.0.10, 3.0.9, 3.0.8, 3.0.7, 3.0.6, 3.0.5, 3.0.4, 3.0.3, 3.0.2, 3.0.1, 3.0.0, 2.3.18, 2.3.17, 2.3.16, 2.3.15, 2.3.14, 2.3.12, 2.3.11, 2.3.10, 2.3.9, 2.3.8, 2.3.7, 2.3.6, 2.3.5, 2.3.4, 2.3.3, 2.3.2, 2.2.3, 2.2.2, 2.1.2, 2.1.1, 2.1.0, 2.0.5, 2.0.4, 2.0.2, 2.0.1, 2.0.0, 1.2.6, 1.2.5, 1.2.4, 1.2.3, 1.2.2, 1.2.1, 1.2.0, 1.1.6, 1.1.5, 1.1.4, 1.1.3, 1.1.2, 1.1.1, 1.1.0, 1.0.0, 0.14.4, 0.14.3, 0.14.2, 0.14.1, 0.13.1, 0.13.0, 0.12.1, 0.12.0, 0.11.1, 0.11.0, 0.10.1, 0.10.0, 0.9.5, 0.9.4.1, 0.9.4, 0.9.3, 0.9.2, 0.9.1, 0.9.0, 0.8.5, 0.8.0)
root@c00295c22cbf:~#


gem install rails -v 5.2.1
root@c00295c22cbf:~# gem install rails -v 5.2.1
Fetching: concurrent-ruby-1.0.5.gem (100%)
Successfully installed concurrent-ruby-1.0.5

root@c00295c22cbf:~# rails -v
Rails 5.2.1

### create a gemset
rvm gemset create gemset_ruby251

root@c00295c22cbf:~# rvm gemset create gemset_ruby251
ruby-2.5.1 - #gemset created /usr/share/rvm/gems/ruby-2.5.1@gemset_ruby251
ruby-2.5.1 - #generating gemset_ruby251 wrappers.......
root@c00295c22cbf:~#


### specify Ruby version and our new gemset
rvm ruby-2.5.1@gemset_ruby251
root@c00295c22cbf:~# rvm ruby-2.5.1@gemset_ruby251
Using /usr/share/rvm/gems/ruby-2.5.1 with gemset gemset_ruby251
root@c00295c22cbf:~# 

ref : https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rvm-on-ubuntu-16-04
root@c00295c22cbf:~# cd /tmp
root@c00295c22cbf:/tmp# \curl -sSL https://deb.nodesource.com/setup_6.x -o nodejs.sh
root@c00295c22cbf:/tmp# less nodejs.sh
root@c00295c22cbf:/tmp# cat /tmp/nodejs.sh | sudo -E bash -

## Installing the NodeSource Node.js 6.x LTS Boron repo...


## Populating apt-get cache...

+ apt-get update

root@c00295c22cbf:/tmp# sudo apt-get install -y nodejs
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  libuv1



sudo docker commit c00295c22cbf ubuntu:All_Ruby

root@docker105:~# docker images
REPOSITORY               TAG                 IMAGE ID            CREATED             SIZE
ubuntu                   All_Ruby            718b05e40a6d        9 seconds ago       759MB *
ubuntu1604               RVM                 85df110f3556        4 hours ago         557MB
ubuntu_ruby              RVM                 2ecfa149fa5b        20 hours ago        603MB


docker save -o /root/All_Ruby.tar ubuntu:All_Ruby

docker load -i /root/All_Ruby.tar

### Problem !

root@5e5b4eb2662a:~# rvm use ruby-2.5.1

RVM is not a function, selecting rubies with 'rvm use ...' will not work.

You need to change your terminal emulator preferences to allow login shell.
Sometimes it is required to use `/bin/bash --login` as the command.
Please visit https://rvm.io/integration/gnome-terminal/ for an example.

### Slove by run

/bin/bash --login
root@5e5b4eb2662a:~# /bin/bash --login
root@5e5b4eb2662a:~# rvm use ruby-2.5.1
Using /usr/share/rvm/gems/ruby-2.5.1
root@5e5b4eb2662a:~# gem -v


rvm use ruby-2.5.1


**** docker exec right command  ******************************************************************

root@docker100:~# docker exec -it ruby /bin/bash --login


**************************************************************************************************

root@c00295c22cbf:~# gem update --system
Updating rubygems-update
Fetching: rubygems-update-2.7.7.gem (100%)
Successfully installed rubygems-update-2.7.7





