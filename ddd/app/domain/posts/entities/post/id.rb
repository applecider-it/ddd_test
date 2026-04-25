# IDのバリューオブジェクト
class Posts::Entities::Post::Id
  attr_reader :value

  def initialize(value)
    unless value.nil?
      raise "type error. #{value.class}" unless value.is_a?(Integer)
    end

    @value = value
  end

  # 同値比較
  def ==(other)
    other.is_a?(self.class) && value == other.value
  end

  def to_s
    value
  end
end
