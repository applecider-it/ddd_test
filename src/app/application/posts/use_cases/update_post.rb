class Posts::UseCases::UpdatePost
  def initialize(repository)
    @repository = repository
  end

  def call(id:, title:, content:)
    post = @repository.find(id)
    post.title = title
    post.content = content
    raise "タイトルが無効です" unless post.valid_title?

    @repository.save(post)
  end
end