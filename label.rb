class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title, color = 'Red')
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item
  end

  def self.all
    ObjectSpace.each_object(self).to_i
  end

  def self.save
    labels = []
    all.each do |label|
      labels << {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end

    File.write('labels.json', JSON.pretty_generate(labels))
    'Label saved to labels.json'
  end

  def self.load_labels
    return unless File.exist?('labels.json')

    labels_file = File.read('labels.json')
    labels = JSON.parse(labels_file)
    labels.each do |label|
      puts "ID: #{label['id']}"
      puts "Title: #{label['title']}"
      puts "Color: #{label['color']}"
      puts "Items: #{label['items']}"
      new(title: label['title'], color: label['color'])
    end
  end
end
