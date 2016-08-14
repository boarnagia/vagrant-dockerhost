# docker-compose 用の Vagrant 設定ファイル

## セットアップ方法

1. Vagrantをインストール、または最新にアップデートしてください

    ダウンロードはこちらから: https://www.vagrantup.com/downloads.html

2. vbguestプラグインを入れていないなら、インストールしてください

    On your console:
    ```
    local# vagrant plugin install vagrant-vbguest
    ```

3. 最後に、Vagrant の設定ファイルをクローンし、環境を立ち上げてください

    ```
    local# git clone https://github.com/boarnagia/vagrant-dockerhost.git dockerhost
    local# cd dockerhost/Vagrant
    local# vagrant up
    ```

## 環境が動くかを確かめてください

1. docker-compose のサンプルファイルを実行します

    ```
    local# vagrant ssh
    vm# cd /vagrant_data/dockers/sample
    vm# docker-compose up -d
    ```

2. サーバが動いているかを確認します

    1. docker-compose で動作状況を確認します

        On your console:
        ```
        vm# docker-compose ps
        Name            Command          State              Ports
        -----------------------------------------------------------------------
        sample-web   nginx -g daemon off;   Up      443/tcp, 0.0.0.0:80->80/tcp
        ```

        State が "Up" になっている場合、正常に起動しています。

    2. Webサーバにアクセスできるかを確認します

        以下のURLがブラウザから開けるかを確認してください

        1. http://192.168.33.10/
        2. http://localhost:8080/
        3. http://(your local machine IP addr):8080/

        以下の画面が確認できたら、Webサーバは正常に起動していて、アクセスを正常にできる状態になっています。
        ![Welcome message](https://assets.wp.nginx.com/wp-content/uploads/2014/01/welcome-screen-e1450116630667.png)

3. VMホスト環境情報

```
Mac version 10.11.6
    ssh -V
        OpenSSH_6.9p1, LibreSSL 2.1.8

    vagrant --version
        Vagrant 1.8.5

Windows 10 Home + cygwin
    ssh -V
        OpenSSH_7.3p1, OpenSSL 1.0.2h 3 May 2016

    vagrant --version
        Vagrant 1.8.5
```

vi: set fenc=utf-8 :
