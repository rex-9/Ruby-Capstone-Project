class Label
  attr_accessor :id, :title, :color, :items

  def initialize(_label)
    @id = Random.rand(1..1000)
    @label = label
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end
end
