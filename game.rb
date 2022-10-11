require_relative 'item'
require 'json'

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

  def save
    if File.exist?('games.json')
      games_file = File.read('games.json')
      games = JSON.parse(games_file)
      games << {
        id: id,
        multiplayer: multiplayer,
        last_played_at: last_played_at,
        genre: genre.name,
        author: author.first_name + " " + author.last_name,
        source: source.name,
        label: label.title,
        published_date: published_date
      }

      File.write('games.json', JSON.pretty_generate(games))
      "Game saved to games.json"
    else
      File.write('games.json', JSON.pretty_generate([{
        id: id,
        multiplayer: multiplayer,
        last_played_at: last_played_at,
        genre: genre.name,
        author: author.first_name + " " + author.last_name,
        source: source.name,
        label: label.title,
        published_date: published_date
      }]))
    end
  end

end

# rubocop:enable Metrics/ParameterLists
