# 投稿データ更新  転送用DTO
class Posts::Dto::UpdatePostDto
  attr_reader :id,
                :title,
                :content

  def initialize(
    id:,
    title:,
    content:
  )
    @id = id
    @title = title
    @content = content
  end
end
