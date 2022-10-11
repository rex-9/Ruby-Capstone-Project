require_relative 'item'
require 'json'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :published_date

  def initialize(multiplayer:, last_played_at:, published_date:)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super(published_date: published_date)
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
        author: "#{author.first_name} #{author.last_name}",
        source: source.name,
        label: label.title,
        published_date: published_date
      }

      File.write('games.json', JSON.pretty_generate(games))
      'Game saved to games.json'
    else
      File.write('games.json', JSON.pretty_generate([{
                                                      id: id,
                                                      multiplayer: multiplayer,
                                                      last_played_at: last_played_at,
                                                      genre: genre.name,
                                                      author: "#{author.first_name} #{author.last_name}",
                                                      source: source.name,
                                                      label: label.title,
                                                      published_date: published_date
                                                    }]))
    end
  end

  def self.load_games
    return unless File.exist?('games.json')

    games_file = File.read('games.json')
    games = JSON.parse(games_file)
    games.each do |game|
      puts "id: #{game['id']}"
      # , game['multiplayer'], genre: game['genre'], author: game['author'], source: game['source'], label: game['label'], published_date: game['published_date']
    end
    puts 'hello'
  end
end
