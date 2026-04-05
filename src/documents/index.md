# Railsモノリス

## MVCS設計

```
app/
  Railsの設計通りのディレクトリ
  controllers/
  views/
  models/

  services/
    article_services/ <- カテゴリー区切り
```

### 命名規則

カテゴリーの区切りは、`services`をポストフィックスにすることで、名前空間の衝突の対応をしている。

クラスは、`service`をポストフィックスにすることで、名前空間の衝突の対応をしている。


## DDD、クリーンアーキテクチャ設計

```
app/
  application/  <- アプリケーション層
    posts/  <- ドメイン区切り
      dto/ <- DTO
      repositories/ <- DIされたレポジトリ
      use_cases/ <- ユースケース

  domain/ <- ドメイン層
    posts/  <- ドメイン区切り
      entities/ <- エンティティ
        post/ <- 各エンティティ用のバリューオブジェクト
      repository_interfaces/ レポジトリのインターフェース
      services/ <- サービスクラス

  infrastructure/ <- インフラ層
    posts/  <- ドメイン区切り
      active_record/  <- アクティブレコードを使った実体

  インターフェース層 (Railsの設計通りのディレクトリ)
  controllers/
  forms/
  views/

  models/ <- アクティブレコードは、Railsの設計通りのディレクトリ
```

### 命名規則

ドメイン区切りを複数形にすることで、名前空間の衝突の対応をしている。

