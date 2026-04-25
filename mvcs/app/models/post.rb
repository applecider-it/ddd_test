require 'redcarpet'

class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true

  # 内容をmarkdown変換したHTML
  def content_html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

    html = markdown.render(content)

    html
  end
end
