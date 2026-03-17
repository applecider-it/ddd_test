# Postリポジトリのインターフェース
class Posts::RepositoryInterfaces::PostRepositoryInterface
  # IDからデータ取得
  # 
  # @param int id
  # 
  # @return Posts::Entities::Post
  def find(id)
    raise NotImplementedError
  end

  # 投稿の保存（登録、更新）
  # 
  # @param Posts::Entities::Post post
  # 
  # @return Posts::Entities::Post
  def save(post)
    raise NotImplementedError
  end

  # 投稿一覧用データ取得
  # 
  # @return [Posts::Entities::Post]
  def all
    raise NotImplementedError
  end

  # 投稿の削除
  # 
  # @param Posts::Entities::Post post
  # 
  # @return nil
  def delete(post)
    raise NotImplementedError
  end
end