class Book < Item
  def initialize(publisher:, cover_state:, published_date)
    super(published_date: published_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
