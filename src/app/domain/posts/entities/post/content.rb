# 内容のバリューオブジェクト
class Posts::Entities::Post::Content
  attr_reader :value

  def initialize(value)
    raise "内容は空にできません" if value.nil? || value.strip.empty?
    @value = value
  end

  # 同値比較
  def ==(other)
    other.is_a?(Content) && value == other.value
  end

  def to_s
    value
  end
end
