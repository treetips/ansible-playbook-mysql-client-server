mysql-client and mysql-server environment playbook
====

## Description

It is `ansible-playbook` to build `mysql-client` and `mysql-server` environment with maintaining idempotency.

Of course the conflict-error at the time of the `yum install mysql-xxx`  does not happen, and the conflict-error at the time of the `yum install MySQL-python` does not happen, too.

## Environment

### Ansible client

* ansible: v2.0
* vagrant: v1.8

### Target server

* os: CentOS v6.5
* mysql: v5.5
* pyenv: latest
* python: v2.7.11

## Usage

### Checkout this repository.

```bash
git clone https://github.com/treetips/ansible-playbook-mysql-client-server.git
```

### Add vagrant box.

```bash
vagrant box add centos6.5 http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box
```

The box name `centos6.5` sets it in Vagrantfile.

### Start up vagrant.

```bash
cd ansible-playbook-mysql-client-server/vagrant
vagrant up
```

If `vagrant up` becomes the error, Look for different vagrant-box.

In Vagrantfile, Add worker user and set a password `worker` and enable sudo by provisioning.

### Perfome ansible-playbook script.

```bash
chmod +x ./playbook.sh
./playbook.sh
```

## Optional

### ssh

```bash
ssh worker@192.168.33.31
```

### Connect mysql-server

Playbook create connect script for mysql-server at home directory.

```bash
ssh worker@192.168.33.31
./mysql.sh
```

Playbook create mysql connect-setting file to home directory.

```bash
$ ls -l ~/.my.cnf
-rw------- 1 worker worker 298 2016-04-23 16:17 /home/worker/.my.cnf

$ cat .my.cnf
[client_root]
host=192.168.33.31
database=hoge
user=root
password=fuga

[client_user]
host=192.168.33.31
database=hoge
user=worker
password=worker
```
