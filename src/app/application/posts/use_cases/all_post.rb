class Posts::UseCases::AllPost
  def initialize(repository)
    @repository = repository
  end

  def call
    posts = @repository.all

    posts.map { |r| to_dto(r) }
  end

  # DTOに変換
  private def to_dto(post)
    Posts::Dto::AllPostDto.new(
      id: post.id,
      title: post.title.value,
      content: post.content.value,
      created_at: post.created_at,
      updated_at: post.updated_at
    )
  end
end