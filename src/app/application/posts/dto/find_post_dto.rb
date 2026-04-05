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
    @id = id
    @title = title
    @content = content
    @created_at = created_at
    @updated_at = updated_at
    @content_html = content_html
  end
end
