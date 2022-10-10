class Book < Item
  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state
  end

  def add_item(Book)
    @items << Book
  end
end
