# rubocop:disable Metrics/ParameterLists
class Item
  attr_reader :id
  attr_accessor :published_date, :archived, :genre

  def initialize(genre:, author:, source:, label:, published_date:, archived: false)
    @id = Random.rand(1..1000)
    @genre = genre
    genre.items << self
    @author = author
    author.items << self
    @source = source
    source.items << self
    @label = label
    label.items << self
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    true if @published_date > 10
  end

  private :can_be_archived?

  def move_to_archived?
    true if can_be_archived? == true
  end

  # def genre=(genre)
  #   @genre = genre
  # end
end
# rubocop:enable Metrics/ParameterLists
