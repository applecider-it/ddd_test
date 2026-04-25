class Posts::PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :title, :string
  attribute :content, :string

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true
end