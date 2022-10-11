require_relative 'game'
require_relative 'genre'
require_relative 'author'
require_relative 'source'
require_relative 'label'

genre = Genre.new('Action')
author = Author.new('John', 'Doe')
source = Source.new('Steam')
label = Label.new('Elden Ring', 'Golden')

game = Game.new(
  true,
  Time.now,
  genre: genre,
  author: author,
  source: source,
  label: label,
  published_date: '18-03-2000'
)
puts game.published_date
# puts genre.items

# genre: genre, author: author, source: source, label: label,
