# 投稿データ一覧  転送用DTO
class Posts::Dto::AllPostDto
  attr_reader :id,
                :title,
                :content,
                :created_at,
                :updated_at

  def initialize(
    id:,
    title:,
    content:,
    created_at: nil,
    updated_at: nil
  )
    raise "type error. #{id.class}" unless id.is_a?(Integer)
    raise "type error. #{title.class}" unless title.is_a?(String)
    raise "type error. #{content.class}" unless content.is_a?(String)
    raise "type error. #{created_at.class}" unless created_at.is_a?(ActiveSupport::TimeWithZone)
    raise "type error. #{updated_at.class}" unless updated_at.is_a?(ActiveSupport::TimeWithZone)

    @id = id
    @title = title
    @content = content
    @created_at = created_at
    @updated_at = updated_at
  end
end
