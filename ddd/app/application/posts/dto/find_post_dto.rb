# 投稿データ取得  転送用DTO
class Posts::Dto::FindPostDto
  attr_reader :id,
              :title,
              :content,
              :created_at,
              :updated_at,
              :content_html

  def initialize(
    id:,
    title:,
    content:,
    created_at: nil,
    updated_at: nil,
    content_html: nil
  )
    raise "type error. #{id.class}" unless id.is_a?(Integer)
    raise "type error. #{title.class}" unless title.is_a?(String)
    raise "type error. #{content.class}" unless content.is_a?(String)
    raise "type error. #{created_at.class}" unless created_at.is_a?(Time)
    raise "type error. #{updated_at.class}" unless updated_at.is_a?(Time)
    raise "type error. #{content_html.class}" unless content_html.is_a?(String)

    @id = id
    @title = title
    @content = content
    @created_at = created_at
    @updated_at = updated_at
    @content_html = content_html
  end
end
