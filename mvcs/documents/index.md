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

