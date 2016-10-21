class Card
  attr_accessor :properties

  def initialize(shape, number, fill, color)
    @properties = [shape, number, fill, color]
  end

  def to_s
    "#{self.number} #{self.color} #{self.fill} #{self.shape}"
  end

  def shape
    return @properties[0]
  end

  def number
    return @properties[1]
  end

  def fill
    return @properties[2]
  end

  def color
    return @properties[3]
  end



end
