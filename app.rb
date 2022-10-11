require_relative 'game'

class App
  def list_books
    puts 'all books'
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
    puts 'this is where you add a book'
  end

  def add_game
    puts 'this is where you add a game'
  end

  def add_movie
    puts 'this is where you add a movie'
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
