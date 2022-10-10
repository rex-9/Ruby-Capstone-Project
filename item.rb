class Item
  attr_reader :id
  attr_accessor :genre, :author, :source, :label, :published_date, :archived

  def initialize(genre, author, source, label, published_date, archived = false)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = published_date
    @archived = archived
  end

  private :can_be_archived?

  def can_be_archived?
    true if @published_date > 10
  end

  def move_to_archived?
    true if can_be_archived? == true
  end
end
