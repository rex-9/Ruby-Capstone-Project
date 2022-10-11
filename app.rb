require_relative 'game'
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
    print 'Enter Author: '
    author = gets.chomp
    print 'Enter Multiplayer [true or false]: '
    multiplayer = gets.chomp
    print 'Enter Last Played At: '
    last_played_at = gets.chomp
    print 'Enter publish date: '
    published_date = gets.chomp
  end

  def exit_method
    puts 'Goodbye!'
    exit
  end

  def list_all_genres
    puts 'all genres'
  end

  def list_all_labels
    puts 'all labels'
  end
end
