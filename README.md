# 使い方

marriage-answer-management システムを本番環境にデプロイします。

テスト環境: CentOS 6.5, CentOS 7.1 on Vagrant 1.6.5

### 0. local環境のnodejsアプリケーション配備の準備

 - roles/deploy/nodejs/files/aaa ディレクトリを削除
 - roles/deploy/nodejs/files/ 以下にnodejsアプリケーションのディレクトリをコピー
 - roles/deploy/nodejs/tasks/main.yml の編集 <br>
    - 配備するディレクトリ名を "aaa"から"nodejsアプリケーションのディレクトリ名"に修正
    - Install aaa application モジュールのダミースクリプトを適宜修正
 - roles/deploy/nodejs/vars/main.yml の編集 (必要であれば)
    - "deploy_dir" を配備先のディレクトリに変更

### 1. no-password loginの有効化

    ssh-copy-id -i ~/.ssh/id_rsa.pub <user>@<your-ipaddress>

### 2. IPアドレスの編集(inventoryファイルの編集)

    sed -i -e "s/192.168.33.33/<your-ipaddress>/g" hosts

### 3. ユーザ名の編集(setup.ymlファイルの編集)

    sed -i -e "s/vagrant/<user>/g" setup.yml
    sed -i -e "s/vagrant/<user>/g" vars/vars.yml

### 4. deployの実行

    ansible-playbook -i hosts setup.yml

### Tips

 - 事前にdeploy server の情報を見たい


    ansible -i hosts <your-ipaddress> -m setup
