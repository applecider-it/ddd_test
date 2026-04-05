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
    @id = id
    @title = title
    @content = content
    @created_at = created_at
    @updated_at = updated_at
  end
end
