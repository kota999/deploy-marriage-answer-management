# 使い方

## master branch と一緒！

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
