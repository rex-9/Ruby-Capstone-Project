require 'date'

# rubocop:disable Metrics/ParameterLists
class Item
  attr_reader :id
  attr_accessor :published_date, :archived, :genre

  def initialize(published_date:, archived: false)
    @id = Random.rand(1..1000)
    # @genre = genre
    # genre.items << self
    # @author = author
    # author.items << self
    # @source = source
    # source.items << self
    # @label = label
    # label.items << self
    @published_date = published_date
    @archived = archived
  end

  def can_be_archived?
    published_year = Date.strptime(@published_date,'%d-%m-%Y').strftime('%Y')
    Time.now.year - published_year.to_i > 10
  end

  private :can_be_archived?

  def move_to_archived?
    can_be_archived? == true
  end

  def genre=(genre)
    @genre = genre
  end

  def author=(author)
    @author = author
  end

  def source=(source)
    @source = source
  end

  def label=(label)
    @label = label
  end
end
# rubocop:enable Metrics/ParameterLists
