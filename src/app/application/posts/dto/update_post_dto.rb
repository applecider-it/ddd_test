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
    raise "type error. #{id.class}" unless id.is_a?(Integer)
    raise "type error. #{title.class}" unless title.is_a?(String)
    raise "type error. #{content.class}" unless content.is_a?(String)

    @id = id
    @title = title
    @content = content
  end
end
