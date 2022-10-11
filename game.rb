require_relative 'item'

# rubocop:disable Metrics/ParameterLists

class Game < Item
  attr_reader :multiplayer, :last_played_at, :genre, :author, :source, :label, :published_date

  def initialize(multiplayer, last_played_at, genre:, author:, source:, label:, published_date:)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(genre: genre, author: author, source: source, label: label, published_date: published_date)
  end

  def can_be_archived?
    super && Time.now.year - @last_played_at.year > 2
  end
end

# rubocop:enable Metrics/ParameterLists
