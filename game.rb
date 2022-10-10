class Game < Item
  def initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    super()
  end

  def add_item(game)
    @items << Game
  end
end
