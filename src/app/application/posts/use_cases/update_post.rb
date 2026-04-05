class Posts::UseCases::UpdatePost
  def initialize(repository)
    @repository = repository
  end

  def call(update_post_dto)
    raise "type error. #{update_post_dto.class}" unless update_post_dto.is_a?(Posts::Dto::UpdatePostDto)

    post = @repository.find(update_post_dto.id)
    post.set_title(update_post_dto.title)
    post.set_content(update_post_dto.content)

    @repository.save(post)
  end
end