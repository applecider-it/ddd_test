# 記事の一覧関連
class PostServices::ListService
  def get_posts
    posts = Post.all

    posts
  end
end