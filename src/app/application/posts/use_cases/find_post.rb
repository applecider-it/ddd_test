class Posts::UseCases::FindPost
  def initialize(repository)
    @repository = repository
  end

  def call(id:)
    raise "type error. #{id.class}" unless id.is_a?(Integer)

    post = @repository.find(id)
    to_dto(post)
  end

  # DTOに変換
  private def to_dto(post)
    Posts::Dto::FindPostDto.new(
      id: post.id,
      title: post.title.value,
      content: post.content.value,
      created_at: post.created_at,
      updated_at: post.updated_at,
      content_html: post.content.html,
    )
  end
end