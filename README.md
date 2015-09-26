# 使い方

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
