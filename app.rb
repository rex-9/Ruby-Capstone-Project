require_relative 'game'
require_relative 'author'
require_relative 'book'

class App
  attr_accessor :items

  def initialize
    @items = []
  end

  def list_books
    puts Book.load_books
  end

  def list_music_albums
    puts 'all music_albums'
  end

  def list_movies
    puts 'all movies'
  end

  def list_games
    puts Game.load_games
  end

  def add_book
    puts 'Add book to library'
    print 'Enter Label: '
    label = gets.chomp
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter publish date: '
    published_date = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp
  end

  def add_game
    puts 'Add Game to library'
    print 'Enter First Name of the Author: '
    first_name = gets.chomp
    print 'Enter Last Name of the Author: '
    last_name = gets.chomp
    author = Author.new(first_name: first_name, last_name: last_name)
    print 'Enter The Name of the Game: '
    name = gets.chomp
    print 'Enter Multiplayer [true or false]: '
    multiplayer = gets.chomp.downcase == 'true'
    print 'Enter Last Played At: '
    last_played_at = gets.chomp
    print 'Enter publish date: '
    published_date = gets.chomp
    Game.new(name: name, multiplayer: multiplayer, last_played_at: last_played_at, published_date: published_date, author: author)
    puts "Game added successfully"
  end

  def list_all_genres
    puts 'all genres'
  end

  def list_all_labels
    puts 'all labels'
  end

  def list_all_authors
    puts Author.load_authors
  end

  def save_and_exit
    Game.save
    Author.save
    puts "Saved All Data Successfully!"
    puts 'See You Next Time!'
    exit
  end
end
