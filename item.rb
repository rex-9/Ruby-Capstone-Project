class Item
  def initialize(genre, author, source, label, published_date, archived)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @published_date = published_date
    @archived = archived
  end

 

end
