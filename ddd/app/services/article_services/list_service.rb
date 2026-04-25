# 記事の一覧関連
class ArticleServices::ListService
  def get_articles
    articles = Article.all

    articles
  end
end