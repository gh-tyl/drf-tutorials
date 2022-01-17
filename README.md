# nuage

## 環境構築
### 必須プラットフォーム
- docker
### 初回の手順(親ディレクトリで作業)
1. pre-commitの導入
    - homebrewを使用している場合(推奨)
    ```
    brew install pre-commit
    pre-commit install
    ```
    - homebrew未使用の場合
    ```
    pip install pre-commit
    pre-commit install
    ```
2. 環境ファイルのコピー
    ```
    cp .env.example .env
    ```
3. コンテナのビルド(初回の所要時間約10分)
    ```
    docker-compose up -d --build
    ```
4. 起動コンテナの確認(STATUSがUpとなっていたら起動済み)
    ```
    docker ps
    ```
5. localhost:8234にアクセス

## Dockerコマンド
### 通常時の起動の手順
- コンテナの起動
    ```
    docker-compose up -d
    ```
- コンテナの起動(ライブラリの追加時)
    ```
    docker-compose up -d --build
    ```
- ログの確認
    ```
    docker logs -f [CONTAINER ID or NANES]
    ```
    - 例
        ```
        docker logs -f nuage-app
        ```
- コンテナの停止
    ```
    docker stop [CONTAINER ID or NAMES]
    ```
    - 例
        ```
        docker stop nuage-app
        ```

### Django関連のコマンド(必要に応じて)
- Djangoのプロジェクトを作成
    ```
    docker-compose run [CONTAINER ID or NAMES] django-admin.py startproject [YOUR PROJECT NAME] .
    ```
- startapp
    ```
    docker-compose run [CONTAINER ID or NAMES] python3 ./manage.py startapp [YOUR APP NAME]
    ```
- makemigrations
    ```
    docker-compose run [CONTAINER ID or NAMES] python3 ./manage.py makemigrations [YOUR APP NAME]
    ```
- migrate
    ```
    docker-compose run [CONTAINER ID or NAMES] python3 ./manage.py migrate [YOUR APP NAME]
    ```
- createsuperuser
    ```
    docker-compose run [CONTAINER ID or NAMES] python3 ./manage.py createsuperuser --username admin --email admin@example.com
    ```

## 開発のルール
#### ブランチのルール
- 本番環境: main
    - デプロイ用ブランチ
- 開発環境: develop
    - 開発の中心となるブランチ
- 新機能開発: feature
    - developから派生
    - 新機能追加やデバッグの際に使用
##### 例(辞書の追加)
```
git checkout -b feature/add_dict
```
#### Git hook
- pre-commitの導入
    - commit前にエラーチェックやコードの整形などを自動で実行
    - commit時にコードの整形を行う必要があり一度エラーが出る場合があるが、その場合はもう一度gitコマンドを実行
        ```
        git add [. or 対象のファイルやディレクトリ]
        ```
        ```
        git commit -m "[任意のメッセージ]"
        ```
        ```
        git push [対象のブランチ]
        ```

## 使い方
- sで線の表示非表示
- e,j,sで英語日本語フランス語の表示非表示
- bでハチドリが飛行
- rで回転On/OFF、mで明滅ON／OFF
# drf-tutorials
