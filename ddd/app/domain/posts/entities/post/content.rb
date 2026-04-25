require 'redcarpet'

# 内容のバリューオブジェクト
class Posts::Entities::Post::Content
  attr_reader :value

  def initialize(value)
    raise "empty error." if value.nil? || value.strip.empty?
    raise "type error. #{value.class}" unless value.is_a?(String)

    @value = value
  end

  # 同値比較
  def ==(other)
    other.is_a?(self.class) && value == other.value
  end

  def to_s
    value
  end

  # 内容をmarkdown変換したHTML
  def html
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

    html = markdown.render(value)

    html
  end
end
