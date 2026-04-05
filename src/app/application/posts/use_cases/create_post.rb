class Posts::UseCases::CreatePost
  def initialize(repository)
    @repository = repository
  end

  def call(create_post_dto)
    raise "type error. #{create_post_dto.class}" unless create_post_dto.is_a?(Posts::Dto::CreatePostDto)

    post = Posts::Entities::Post.new(
      id: nil,
      title: create_post_dto.title,
      content: create_post_dto.content,
      created_at: Time.now, 
      updated_at: Time.now
    )

    result = @repository.create(post)

    result.id.value
  end
end