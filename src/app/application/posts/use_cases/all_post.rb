class Posts::UseCases::AllPost
  def initialize(repository)
    @repository = repository
  end

  def call
    posts = @repository.all

    posts.map { |r| r.to_dto }
  end
end