require_relative 'app'

puts 'Welcome to Catalog of my things'
puts ' '

def main
  app = App.new
  loop do
    puts 'Please choose an option by entering a number'
    puts ' 1 - List all books'
    puts ' 2 - List all music albums'
    puts ' 3 - List all movies'
    puts ' 4 - List of games'
    puts ' 5 - List all genres (Comedy, Thriller)'
    puts ' 6 - List all labels (Gift, New)'
    puts ' 7 - List all authors (Stephen King)'
    puts ' 8 - List all sources (From a friend, Online shop)'
    puts ' 9 - Add a book'
    puts '10 - Add a movie'
    puts '11 - Add a game'
    puts '12 - Exit'
    option = gets.chomp.to_i
    select = Selection.new
    select.select_method(option, app)
    select.select_extra_method(option, app)
    select.abort_method(option, app)
  end
end

class Selection
  def select_method(option, app)
    case option
    when 1
      app.list_books
    when 2
      app.list_music_albums
    when 3
      app.list_movie
    when 4
      app.list_games
    when 5
      app.list_all_genres
    when 6
      app.list_all_labels
    end
  end

  def select_extra_method(option, app)
    case option
    when 7
      app.list_all_authors
    when 8
      app.list_all_sources
    when 9
      app.add_book
    when 10
      app.add_movie
    when 11
      app.add_game
    end
  end

  def abort_method(option, app)
    app.exit_method unless option != 12
  end
end

main
