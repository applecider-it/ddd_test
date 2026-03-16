# Postリポジトリのインターフェース
class Posts::RepositoryInterfaces::PostRepositoryInterface
  def find(id)
    raise NotImplementedError
  end

  def save(post)
    raise NotImplementedError
  end

  def all
    raise NotImplementedError
  end

  def delete(post)
    raise NotImplementedError
  end
end