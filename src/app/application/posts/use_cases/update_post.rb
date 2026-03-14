class Posts::UseCases::UpdatePost
  def initialize(repository)
    @repository = repository
  end

  def call(id:, title:, content:)
    post = @repository.find(id)
    post.set_title(title)
    post.set_content(content)

    @repository.save(post)
  end
end