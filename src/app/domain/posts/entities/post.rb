class Posts::Entities::Post
  attr_accessor :id, :title, :content, :created_at, :updated_at

  def initialize(id:, title:, content:, created_at:, updated_at:)
    @id = id
    @title = title
    @content = content
    @created_at = created_at
    @updated_at = updated_at
  end

  # ドメインルールをここに定義
  def valid_title?
    !title.nil? && title.length <= 100
  end
end
