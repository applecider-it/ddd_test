class Posts::ActiveRecord::PostRepositoryImpl < Posts::Repositories::PostRepository
  def find(id)
    record = ::Post.find(id)
    build_entity(record)
  end

  def save(post)
    record = post.id ? ::Post.find(post.id) : ::Post.new
    record.title = post.title
    record.content = post.content
    record.save!
    build_entity(record)
  end

  def all
    ::Post.all.map { |r| build_entity(r) }
  end

  def delete(post)
    ::Post.find(post.id).destroy
  end

  private

  def build_entity(record)
    Posts::Entities::Post.new(
      id: record.id,
      title: record.title,
      content: record.content,
      created_at: record.created_at,
      updated_at: record.updated_at
    )
  end
end