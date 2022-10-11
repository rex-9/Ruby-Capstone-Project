require_relative 'item'
require 'json'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :published_date, :author

  def initialize(multiplayer:, last_played_at:, published_date:, author:)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
    super(published_date: published_date)
  end

  def can_be_archived?
    super && Time.now.year - @last_played_at.year > 2
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    games = []
    all.each do |game|
      games << {
        id: game.id,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        author: {
          id: game.author.id,
          first_name: game.author.first_name,
          last_name: game.author.last_name
        },
        published_date: game.published_date
      }
    end

    File.write('games.json', JSON.pretty_generate(games))
    'Games saved successfully'
  end

  def self.load_games
    return unless File.exist?('games.json')

    games_file = File.read('games.json')
    games = JSON.parse(games_file)
    games.each do |game|
      new(
        multiplayer: game['multiplayer'],
        last_played_at: game['last_played_at'],
        author: Author.new(first_name: game['author']['first_name'], last_name: game['author']['last_name']),
        published_date: game['published_date']
      )
    end
  end
end
