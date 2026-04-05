# タイトルのバリューオブジェクト
class Posts::Entities::Post::Title
  attr_reader :value

  def initialize(value)
    raise "empty error." if value.nil? || value.strip.empty?
    raise "type error. #{value.class}" unless value.is_a?(String)

    raise "タイトルは100文字以下で入力してください" if value.length > 100
    @value = value
  end

  # 同値比較
  def ==(other)
    other.is_a?(Title) && value == other.value
  end

  def to_s
    value
  end
end
