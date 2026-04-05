# 投稿レポジトリのアクティブレコードによる実体
class Posts::ActiveRecord::PostRepositoryImpl < Posts::RepositoryInterfaces::PostRepositoryInterface
  def all
    ::Post.order(id: :desc).map { |record| build_entity(record) }
  end

  def find(id)
    record = ::Post.find(id)
    build_entity(record)
  end

  def create(post)
    raise "type error. #{post.class}" unless post.is_a?(Posts::Entities::Post)

    record = ::Post.new
    record.title = post.title.value
    record.content = post.content.value
    record.save!
    build_entity(record)
  end

  def update(post)
    raise "type error. #{post.class}" unless post.is_a?(Posts::Entities::Post)

    record = ::Post.find(post.id.value)
    record.title = post.title.value
    record.content = post.content.value
    record.save!
    build_entity(record)
  end

  def delete(post)
    raise "type error. #{post.class}" unless post.is_a?(Posts::Entities::Post)

    ::Post.find(post.id.value).destroy
    nil
  end

  private

  # アクティブレコードモデルから、ドメインモデルを生成
  def build_entity(record)
    raise "type error. #{record.class}" unless record.is_a?(::Post)

    Posts::Entities::Post.new(
      id: record.id,
      title: record.title,
      content: record.content,
      created_at: record.created_at.to_time,
      updated_at: record.updated_at.to_time
    )
  end
end