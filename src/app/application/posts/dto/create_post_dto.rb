# 投稿データ作成  転送用DTO
class Posts::Dto::CreatePostDto
  attr_reader :title,
                :content

  def initialize(
    title:,
    content:
  )
    @title = title
    @content = content
  end
end
