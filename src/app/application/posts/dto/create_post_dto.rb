# 投稿データ作成  転送用DTO
class Posts::Dto::CreatePostDto
  attr_reader :title,
                :content

  def initialize(
    title:,
    content:
  )
    raise "type error. #{title.class}" unless title.is_a?(String)
    raise "type error. #{content.class}" unless content.is_a?(String)

    @title = title
    @content = content
  end
end
