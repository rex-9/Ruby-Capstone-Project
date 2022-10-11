require_relative 'game'
require_relative 'author'

# author = Author.new(first_name: 'Rex', last_name: 'Soul')

# game = Game.new(
#   multiplayer: true,
#   last_played_at: Time.now,
#   published_date: '18-03-2000'
# )

# game2 = Game.new(
#   multiplayer: false,
#   last_played_at: Time.now,
#   published_date: '10-03-2000'
# )

# author.add_item(game)
# author.add_item(game2)

puts Game.load_games

# puts Author.save
# puts Game.save

# puts book.can_be_archived?
# author.add_item(game)
# puts author.items.inspect


# user choose 'add a game'
# we will ask the user to create a new author
# create new author
# ask for multiplayer and published_date
# create game with author