# 使い方

marriage-answer-management システムを本番環境にデプロイします.

構築サーバのテスト環境: CentOS 6.5 & CentOS 7.1 on Vagrant 1.6.5<br>
配備サーバのテスト環境: python 2.7.5 & ansible 1.8.2


### 0. local環境のnodejsアプリケーション配備の準備

 - roles/deploy/nodejs/files/aaa ディレクトリを削除
 - roles/deploy/nodejs/files/ 以下にnodejsアプリケーションのディレクトリをコピー
 - roles/deploy/nodejs/tasks/main.yml の編集 <br>
    - 配備するディレクトリ名を **"aaa"**から**"nodejsアプリケーションのディレクトリ名"**に修正
    - Install aaa application モジュールのダミースクリプトを適宜修正
 - roles/deploy/nodejs/vars/main.yml の編集 (必要であれば)
    - **"deploy_dir"** を配備先のディレクトリに変更

### 1. no-password loginの有効化

    ssh-copy-id -i ~/.ssh/id_rsa.pub <user>@<your-ipaddress>

### 2. IPアドレスの編集(inventoryファイルの編集)

    sed -i -e "s/192.168.33.33/<your-ipaddress or hostname>/g" hosts

### 3. ユーザ名の編集(setup.ymlファイルの編集)

    sed -i -e "s/vagrant/<user>/g" setup.yml
    sed -i -e "s/vagrant/<user>/g" vars/vars.yml

### 4. deployの実行

    ansible-playbook -i hosts setup.yml


### おまけ

###### 事前にdeploy server の情報を見たい

    ansible -i hosts <your-ipaddress> -m setup

###### serverspec を使ってみた(ちょっと)

serverspecでdeploy/install/service/firewall...の設定成否をテストしてみた on ruby 2.1.5 and serverspec 2.24.1.<br>
一応、どこでも使える様に修正点は最小限になる様に努力したつもり....<br>
master_roles, hosts, roles の構成にテストを分けて、ansibleのフォルダ構成に寄せたつもり....

事前準備:
 - ~~spec/marriage 以下のファイル内の***"user = 'vagrant'"***を修正~~
 - ~~spec/marriage ディレクトリの**"ディレクトリ名"**をデプロイ環境の**"ホスト名"**に変更~~<br>
    ~~(defaultは**"marriage"**)~~
 - spec/hosts.yml 内の":user: ***vagrant***"を修正
 - spec/hosts.yml 内の":hosts:"のhost名を修正

使い方:

    rake spec            # 全てのサーバにテスト実行
    rake -T              # 各サーバへのテスト実行オプションを見る
    rake spec -j 2 -m    # 並列実行
