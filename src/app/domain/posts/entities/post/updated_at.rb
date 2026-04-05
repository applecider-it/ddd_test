# 更新日時のバリューオブジェクト
class Posts::Entities::Post::UpdatedAt
  attr_reader :value

  def initialize(value)
    raise "empty error." if value.nil?
    raise "type error. #{value.class}" unless value.is_a?(Time)

    @value = value
  end

  # 同値比較
  def ==(other)
    other.is_a?(UpdatedAt) && value == other.value
  end

  def to_s
    value
  end
end
