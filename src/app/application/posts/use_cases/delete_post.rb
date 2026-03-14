class Posts::UseCases::DeletePost
  def initialize(repository)
    @repository = repository
  end

  def call(id:)
    post = @repository.find(id)

    @repository.delete(post)
  end
end