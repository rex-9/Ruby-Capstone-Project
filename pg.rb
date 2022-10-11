require_relative 'game'
require_relative 'author'

author = Author.new(first_name: 'John', last_name: 'Doe')

game = Game.new(
  multiplayer: true,
  last_played_at: Time.now,
  published_date: '18-03-2000'
)

author.add_item(game)

puts game.save

# puts book.can_be_archived?
# author.add_item(game)
# puts author.items.inspect
