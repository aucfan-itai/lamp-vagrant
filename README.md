# LAMP環境の開発環境を作成
## Vitural Box,Vagrant,Chef,knife-soloのインストール
#### Vitural Box
[こちら](https://www.virtualbox.org/wiki/Downloads)からインストール
#### Vagrant
[こちら](https://www.vagrantup.com/downloads)からインストール
#### Chef
```bash
gem i chef --no-ri --no-rdoc
knife configure
```
#### knife-solo
```bash
gem i knife-solo --no-ri --no-rdoc
```
## 各種ソースコードをclone
適当なディレクトリで以下を実行
#### lamp-vagrant
```bash
git clone git@github.com:aucfan-itai/lamp-vagrant.git
```
## vagrantの準備
```bash
vagrant box add CentOS-6.4-x86_64 http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20131103.boxvagrant init CentOS-6.4-x86_64
vagrant up
vagrant ssh-config --host vagrant >> ~/.ssh/config
```
## knife-soloの実行
同じディレクトリで以下を実行
```bash
knife solo prepare vagrant 
knife solo cook vagrant
```
