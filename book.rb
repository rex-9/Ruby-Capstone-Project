class Book < Item
  def initialize(publisher, cover_state)
    @publisher = publisher
    @cover_state = cover_state
    super()
  end

  def add_item(Book)
    @items << Book
  end
end
