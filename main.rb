require_relative 'app'

puts 'Welcome to Catalog of my things'
puts ' '

def main
  app = App.new
  loop do
    puts 'Please choose an option by entering a number'
    puts ' 1 - List all Books'
    puts ' 2 - Add a Book'
    puts ' 3 - List all Music Albums'
    puts ' 4 - Add a Music Album'
    puts ' 5 - List all Games'
    puts ' 6 - Add a Game'
    puts ' 7 - List all Labels (Gift, New)'
    puts ' 8 - List all Genres (Comedy, Thriller)'
    puts ' 9 - List all Authors (Stephen King)'
    puts '10 - Save and Exit'
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
      app.add_book
    when 3
      app.list_music_albums
    when 4
      app.add_music_album
    when 5
      app.list_games
    when 6
      app.add_game
    end
  end

  def select_extra_method(option, app)
    case option
    when 7
      app.list_all_labels
    when 8
      app.list_all_genres
    when 9
      app.list_all_authors
    end
  end

  def abort_method(option, app)
    app.save_and_exit unless option != 10
  end
end

main