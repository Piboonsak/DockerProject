-----------------------------------------------------------------------------

# Prepare Ubuntu 16.04 for Docker hosts

## change root password
```sh
root@ubuntu16:~# passwd
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
```

-----------------------------------------------------------------------------

## Install htop
```sh
root@ubuntu16:~# apt-get update
Hit:1 http://us.archive.ubuntu.com/ubuntu xenial InRelease
Get:2 http://security.ubuntu.com/ubuntu xenial-security InRelease [107 kB]
.
.
.
root@ubuntu16:~# apt-get install htop
Reading package lists... Done
Building dependency tree       
Reading state information... Done
```

-----------------------------------------------------------------------------

## Config network interfaces
root@ubuntu16:~# `nano /etc/network/interfaces`

# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

`source /etc/network/interfaces.d/*`

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
```sh
auto ens160
iface ens160 inet static
address 192.168.23.100
netmask 255.255.255.0
gateway 192.168.23.254
dns-nameservers 192.168.10.10 192.168.10.11
```
-----------------------------------------------------------------------------

## Config hosts
root@ubuntu16:~# `nano /etc/hosts`

```sh
127.0.0.1       localhost

# Docker Swarm
192.168.23.100    docker100.traceongroup.com       docker100
192.168.23.101    docker101.traceongroup.com       docker101
192.168.23.102    docker102.traceongroup.com       docker102
192.168.23.103    docker103.traceongroup.com       docker103
192.168.23.104    docker104.traceongroup.com       docker104
```
# The following lines are desirable for IPv6 capable hosts
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters

```sh
root@ubuntu16:~# /etc/init.d/networking restart
[ ok ] Restarting networking (via systemctl): networking.service.
```
-----------------------------------------------------------------------------
## Check firewall Status

```sh
root@docker100:~# service firewall status
● firewall.service
   Loaded: not-found (Reason: No such file or directory)
   Active: inactive (dead)
```

-----------------------------------------------------------------------------
# After Clone image.

## Set ssh
```sh
root@docker100:~# ssh-keygen
root@docker100:~# cat .ssh/id_rsa.pub
```

### docker100

```sh
 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD06tt7GLbQf1a/DtPp0GekhHlS1Y+CrDhB45af7gHhk+KZPWNKpxPmxLqpppDxQ/8rxJwTB3qDRRqTLzeQ8J/gsb+ywAbno8yKdvHHp4XQz7IGcCHxIM4HUSxkEN3JixoacAGluOFMguzNLRfvX/lGTZd3hm1H8lyy8gAKzkPS6RlCwzMJyylVU8qP4iCHyGMZUHCQPjdH9sBoz1Fg0MyEvz2qRCLY+/x1QWR9xL3zHkhl6rJsmeinB2sKvBD5Gq72Mmy6S0DamN6EV7azyy7eL4uvMA+TutqWtTygbB/FPvtUdNF7nnvPwvQGZJIc8bZmhC3WTgAYm4aJSp4DgkZ root@docker100

```

### docker101

```sh
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCublp1r+jiJ7zHe8x/C1Th+NmR4JTQGywG/UcJ13bFWl1w9MqnVsGSfg9aD7Au0t1tikEPxM5LDNPKKhc7CyriNSLLmVYa1yByPUP8MTc2A+Rk4amYQKwq4A1Z98LWAPtdY8DuFbml2CkMYGA9lkcEDXX0lxKqYDpxoZBfyYU1z3NHgkpWzC4ToLvbjum16qd7uM++ZgagP/3xpE09xVS4F/IadnquaS7lRBRaKk+jLPBN4Y9TIpJkWCH7b4NMxAakG+JauuVVdJjuEWYtXTHiLWZzVQBAntR6syrgiVr0u67ADsVEB27xvG65UTcg6X0O2FNr91IxR5Zr9ZWz1TxT root@docker101
```

### docker102

```sh
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCc6gITfi9/1sND1x0592vrg1ZeNuupylao8Q8W5v3phFE3QLAqit+QRv9wL+ebMTaMitWihxQMhcIu5oyjjnVDAL9ZGYnBfiCaulQSqDJFPkbzjPs1b5p9VbNE4roklpQSKF1vCiqgeDucOtLrNz6jt5V7zo1AH6zmZPkvbG+51Lm4umtYH+VJXbMxEIS2o73dSfHeZ8ZX70XyXRgV1d1IHFORwtpUYKo+sop0bAkiUW77at9i6o/sBhOvzaYMNHhE1xGcMLmFTsJD8Mgs19kCBswrLVxXZj/MxchXe9fEjfeYYwyq/3o8oPkEfzjsDglr3ezPgT0lSN9FhRzw7qyJ root@docker102

```



### docker103

```sh
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCr81nFxNNdjTTUHtQTCmo0BWl+PU/MhCQBQwr4LWAsyEcPopf4/3YzLf+YYqizyc3z2B2exmfrpKqloGbwkqQS3Nqf9t/XgeX6cteOPIJBo8rm+kFwQkJziUEiSoD7b+lCj3BIvH1Dmb9eEE4Eyod95CbdXM5dCpVw8rVCGK5nGosYKRwgmIFzQLnZa654cvWAWorQs7ZPvWr1fggaRHqhPmLUKSOjLgqP6+oazCXrcFrchPCeLmEL4/IEStfxbnBWfvmsSefRgHsb4BwTEtokTcNQ41jjDW1eM8zqvRTRsQTT3MOiADSYpy6gXrL0+7FmVSybZjfNlMWUPg/Gfda/ root@docker103

```

### docker104

```sh

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMlpHH8B0SMuGa1KbtsbhFMSU7xX+4nQXH8r/FPpYetDK7MgJY9vwfKU1yNuiYCkOlJVkVqVepAFG6lCidZpOsKnJbnZdNpKSpT9b7tkxL9Y1xW2Ft2eN7NB1orDhnjYuboQFFQEs32A7VPPfFSdPnyAIINCBfi2Vov7zspcLH/xeOIZUVTAE39+qVRf4GeyGsoM8PTpY6Bc4sOsdj4+QfJIPj/uOwfmLTLmbfBNAJxUJ92e31tvq2+L7/0UjUuoGyrF9THshQvH8Ia8T1f+TVGlLmvAv7eWgaWGKie5lgop/+PZSexhoTHxGvGKoYcWKcC2JZBCmRbY5PqmTAZajt root@docker104

```

### pibonsak-hp

```sh

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqoH+XieMvjaFA+nukEeLShGTqxlutB7mWz56Uzawh8oH0NK+YO0PPbIouMutNOXJrbjjCKdS1BwPZIEQx2xl1EyXWgO1XLTyU6u49a66n7+CeleCpK2eQp9enM6vIBNwHLOUXc6x+RcwEJCsfiLYXK9f5ikVbvzzRUkjH+5MmP2CquKHjSGO6BsQvj+wek09L1h/GzX1JjbyWRRL7tlnwIK2fR4Bp/vIyLCj4XK5LA5wU3hz885MozIywrmyADW90HocTSuxb+SobpphGIx/c6VZtwThZunw1mdri0nLheDZaoAbwlL67QZlib08GwsLJ5XAknLFHSb4YO9AEa6wn root@pibonsak-hp
```

## Add key to each host

```sh
root@pibonsak-hp:~# ssh test@docker100
test@docker100's password: 
Welcome to Ubuntu 16.04.4 LTS (GNU/Linux 4.4.0-116-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

112 packages can be updated.
46 updates are security updates.

```

`nano .ssh/authorized_keys`

root@docker100:~# nano .ssh/authorized_keys

```sh

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDD06tt7GLbQf1a/DtPp0GekhHlS1Y+CrDhB45af7gHhk+KZPWNKpxPmxLqpppDxQ/8rxJwTB3qDRRqTLzeQ8J/gsb+ywAbno8yKdvHHp4XQz7IGcCHxIM4HUSxkEN3JixoacAGluOFMguzNLRfvX/lGTZd3hm1H8lyy8gAKzkPS6RlCwzMJyylVU8qP4iCHyGMZUHCQPjdH9sBoz1Fg0MyEvz2qRCLY+/x1QWR9xL3zHkhl6rJsmeinB2sKvBD5Gq72Mmy6S0DamN6EV7azyy7eL4uvMA+TutqWtTygbB/FPvtUdNF7nnvPwvQGZJIc8bZmhC3WTgAYm4aJSp4DgkZ root@docker100
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCublp1r+jiJ7zHe8x/C1Th+NmR4JTQGywG/UcJ13bFWl1w9MqnVsGSfg9aD7Au0t1tikEPxM5LDNPKKhc7CyriNSLLmVYa1yByPUP8MTc2A+Rk4amYQKwq4A1Z98LWAPtdY8DuFbml2CkMYGA9lkcEDXX0lxKqYDpxoZBfyYU1z3NHgkpWzC4ToLvbjum16qd7uM++ZgagP/3xpE09xVS4F/IadnquaS7lRBRaKk+jLPBN4Y9TIpJkWCH7b4NMxAakG+JauuVVdJjuEWYtXTHiLWZzVQBAntR6syrgiVr0u67ADsVEB27xvG65UTcg6X0O2FNr91IxR5Zr9ZWz1TxT root@docker101
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCc6gITfi9/1sND1x0592vrg1ZeNuupylao8Q8W5v3phFE3QLAqit+QRv9wL+ebMTaMitWihxQMhcIu5oyjjnVDAL9ZGYnBfiCaulQSqDJFPkbzjPs1b5p9VbNE4roklpQSKF1vCiqgeDucOtLrNz6jt5V7zo1AH6zmZPkvbG+51Lm4umtYH+VJXbMxEIS2o73dSfHeZ8ZX70XyXRgV1d1IHFORwtpUYKo+sop0bAkiUW77at9i6o/sBhOvzaYMNHhE1xGcMLmFTsJD8Mgs19kCBswrLVxXZj/MxchXe9fEjfeYYwyq/3o8oPkEfzjsDglr3ezPgT0lSN9FhRzw7qyJ root@docker102
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCr81nFxNNdjTTUHtQTCmo0BWl+PU/MhCQBQwr4LWAsyEcPopf4/3YzLf+YYqizyc3z2B2exmfrpKqloGbwkqQS3Nqf9t/XgeX6cteOPIJBo8rm+kFwQkJziUEiSoD7b+lCj3BIvH1Dmb9eEE4Eyod95CbdXM5dCpVw8rVCGK5nGosYKRwgmIFzQLnZa654cvWAWorQs7ZPvWr1fggaRHqhPmLUKSOjLgqP6+oazCXrcFrchPCeLmEL4/IEStfxbnBWfvmsSefRgHsb4BwTEtokTcNQ41jjDW1eM8zqvRTRsQTT3MOiADSYpy6gXrL0+7FmVSybZjfNlMWUPg/Gfda/ root@docker103
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDMlpHH8B0SMuGa1KbtsbhFMSU7xX+4nQXH8r/FPpYetDK7MgJY9vwfKU1yNuiYCkOlJVkVqVepAFG6lCidZpOsKnJbnZdNpKSpT9b7tkxL9Y1xW2Ft2eN7NB1orDhnjYuboQFFQEs32A7VPPfFSdPnyAIINCBfi2Vov7zspcLH/xeOIZUVTAE39+qVRf4GeyGsoM8PTpY6Bc4sOsdj4+QfJIPj/uOwfmLTLmbfBNAJxUJ92e31tvq2+L7/0UjUuoGyrF9THshQvH8Ia8T1f+TVGlLmvAv7eWgaWGKie5lgop/+PZSexhoTHxGvGKoYcWKcC2JZBCmRbY5PqmTAZajt root@docker104
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCqoH+XieMvjaFA+nukEeLShGTqxlutB7mWz56Uzawh8oH0NK+YO0PPbIouMutNOXJrbjjCKdS1BwPZIEQx2xl1EyXWgO1XLTyU6u49a66n7+CeleCpK2eQp9enM6vIBNwHLOUXc6x+RcwEJCsfiLYXK9f5ikVbvzzRUkjH+5MmP2CquKHjSGO6BsQvj+wek09L1h/GzX1JjbyWRRL7tlnwIK2fR4Bp/vIyLCj4XK5LA5wU3hz885MozIywrmyADW90HocTSuxb+SobpphGIx/c6VZtwThZunw1mdri0nLheDZaoAbwlL67QZlib08GwsLJ5XAknLFHSb4YO9AEa6wn root@pibonsak-hp

```

`service sshd restart`


























