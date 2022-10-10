class MusicAlbum < Item
  def initialize(on_spotify)
    @on_spotify = on_spotify
    super()
  end
end
