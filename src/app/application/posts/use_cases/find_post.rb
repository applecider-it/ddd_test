class Posts::UseCases::FindPost
  def initialize(repository)
    @repository = repository
  end

  def call(id:)
      post = @repository.find(id)
      post.to_dto
  end
end