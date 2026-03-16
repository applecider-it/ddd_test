# Postリポジトリのインターフェース
class Posts::RepositoryInterfaces::PostRepositoryInterface
  # IDからデータ取得
  def find(id)
    raise NotImplementedError
  end

  # 投稿の保存（登録、更新）
  def save(post)
    raise NotImplementedError
  end

  # 投稿一覧用データ取得
  def all
    raise NotImplementedError
  end

  # 投稿の削除
  def delete(post)
    raise NotImplementedError
  end
end