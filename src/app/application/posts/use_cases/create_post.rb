# app/application/posts/use_cases/create_post.rb
class Posts::UseCases::CreatePost
  def initialize(repository)
    @repository = repository
  end

  def call(title:, content:)
    post = Posts::Entities::Post.new(id: nil, title: title, content: content, created_at: Time.now, updated_at: Time.now)

    result = @repository.save(post)

    result.id
  end
end