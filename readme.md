## StackSkills - Linux Shell Scripting

This is my code for StackSkills' MOOC Linux Shell Scripting

#### Virtual Environment

Instead of running VirtualBox and Vagrant to boot up a virtual machine, 
as recommended in the lectures, I'm running all my scripts inside a 
Docker container, spinned up from the official image centos:7.

> docker run -it --name stackskills --rm -v `pwd`:/opt/stackskills -w /opt/stackskills centos:7 

