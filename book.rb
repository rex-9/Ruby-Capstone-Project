class Book < Item
  def initialize(publisher, cover_state)
    super(genre, author, source, label, published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  # def can_be_archived?
  #   true super == true || cover_state == 'bad'
  # end
end
