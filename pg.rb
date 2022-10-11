require_relative 'game'
require_relative 'book'
require_relative 'genre'
require_relative 'author'
require_relative 'source'
require_relative 'label'

genre = Genre.new('Action')
author = Author.new('John', 'Doe')
source = Source.new('Steam')
label = Label.new('Elden Ring', 'Golden')

game = Game.new(
  multiplayer: true,
  last_played_at: Time.now,
  published_date: '18-03-2000'
)

book = Book.new(
  publisher: true,
  cover_state: 'good',
  published_date: '18-03-2000'
)

# puts game.can_be_archived?

# puts book.can_be_archived?
# genre.add_item(game)
# author.add_item(game)
# label.add_item(game)
# source.add_item(game)
# genre.add_item(book)
# author.add_item(book)
# label.add_item(book)
# source.add_item(book)
# puts genre.items.inspect
# puts author.items.inspect
# puts label.items.inspect
# puts source.items.inspect

# genre: genre, author: author, source: source, label: label,
