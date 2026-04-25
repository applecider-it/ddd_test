# 投稿ドメインモデル
class Posts::Entities::Post
  attr_reader :id, :title, :content, :created_at, :updated_at

  def initialize(id:, title:, content:, created_at:, updated_at:)
    set_id(id)
    set_title(title)
    set_content(content)
    set_created_at(created_at)
    set_updated_at(updated_at)
  end

  def set_id(value)
    @id = Id.new(value)
  end
  def set_title(value)
    @title = Title.new(value)
  end
  def set_content(value)
    @content = Content.new(value)
  end
  def set_created_at(value)
    @created_at = CreatedAt.new(value)
  end
  def set_updated_at(value)
    @updated_at = UpdatedAt.new(value)
  end
end
