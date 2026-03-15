class Posts::ActiveRecord::PostRepositoryImpl < Posts::Repositories::PostRepository
  def find(id)
    record = ::Post.find(id)
    build_entity(record)
  end

  def save(post)
    raise "Invalid Object" unless post.is_a?(Posts::Entities::Post)

    record = post.id ? ::Post.find(post.id) : ::Post.new
    record.title = post.title
    record.content = post.content
    record.save!
    build_entity(record)
  end

  def all
    ::Post.order(id: :desc).map { |r| build_entity(r) }
  end

  def delete(post)
    raise "Invalid Object" unless post.is_a?(Posts::Entities::Post)

    ::Post.find(post.id).destroy
  end

  private

  def build_entity(record)
    raise "Invalid Object" unless record.is_a?(::Post)

    Posts::Entities::Post.new(
      id: record.id,
      title: record.title,
      content: record.content,
      created_at: record.created_at,
      updated_at: record.updated_at
    )
  end
end