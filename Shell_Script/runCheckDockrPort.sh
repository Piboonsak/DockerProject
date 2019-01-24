#!/bin/bash

echo "!!!check port docker100!!!"
netstat -tlnp

echo "!!!check port docker101!!!"
ssh docker101 netstat -tlnp

echo "!!!check port docker102!!!"
ssh docker102 netstat -tlnp

echo "!!!check port docker103!!!"
ssh docker103 netstat -tlnp

echo "!!!check port docker104!!!"
ssh docker104 netstat -tlnp

echo "!!!check port docker105!!!"
ssh docker105 netstat -tlnp

echo "!!!Check port all nodes completed!!!"