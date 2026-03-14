class Posts::UseCases::UpdatePost
  def initialize(repository)
    @repository = repository
  end

  def call(post_dto)
    raise "Invalid Object" unless post_dto.is_a?(Posts::Dto::PostDto)

    post = @repository.find(post_dto.id)
    post.set_title(post_dto.title)
    post.set_content(post_dto.content)

    @repository.save(post)
  end
end