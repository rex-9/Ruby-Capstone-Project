require_relative 'game'
require_relative 'book'
require_relative 'label'

class App
  attr_accessor :items, :labels, :books

  def initialize
    @items = items
    @labels = labels
    @books = books
  end

  def list_books
    book = Book.new
    book.load_books
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
    print 'Enter Publisher: '
    publisher = gets.chomp
    print 'Enter publish date: '
    published_date = gets.chomp
    print 'Cover State: '
    cover_state = gets.chomp
    book = Book.new(publisher, published_date, cover_state)
    book.save
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
    puts Label.load_labels
  end
end
