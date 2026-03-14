# Postドメインモデル
class Posts::Entities::Post
  attr_reader :id, :title, :content, :created_at, :updated_at

  def initialize(id:, title:, content:, created_at:, updated_at:)
    @id = id
    set_title(title)
    set_content(content)
    @created_at = created_at
    @updated_at = updated_at
  end

  def set_title(value)
    @title = Title.new(value)
  end

  def set_content(value)
    @content = Content.new(value)
  end

  def to_dto
    Posts::Dto::PostDto.new(
      id: @id,
      title: @title.value,
      content: @content.value,
      created_at: created_at,
      updated_at: updated_at,
    )
  end
end
