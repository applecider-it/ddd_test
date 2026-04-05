class Posts::UseCases::DeletePost
  def initialize(repository)
    @repository = repository
  end

  def call(id:)
    raise "type error. #{id.class}" unless id.is_a?(Integer)

    post = @repository.find(id)

    @repository.delete(post)
  end
end