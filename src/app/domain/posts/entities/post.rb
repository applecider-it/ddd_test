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

  def set_title(vo)
    raise "Invalid Title Object" unless vo.is_a?(Title)
    @title = vo
  end

  def set_content(vo)
    raise "Invalid Content Object" unless vo.is_a?(Content)
    @content = vo
  end
end
