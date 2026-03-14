class Posts::UseCases::CreatePost
  def initialize(repository)
    @repository = repository
  end

  def call(post_dto)
    raise "Invalid Object" unless post_dto.is_a?(Posts::Dto::PostDto)

    post = Posts::Entities::Post.new(
      id: nil,
      title: post_dto.title,
      content: post_dto.content,
      created_at: Time.now, 
      updated_at: Time.now
    )

    result = @repository.save(post)

    result.id
  end
end