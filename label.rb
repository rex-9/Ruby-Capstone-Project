class Label
  attr_reader :id
  attr_accessor :title, :color, :items

  def initialize(title:, color: 'Red')
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
    ObjectSpace.each_object(self).to_a
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
    'Labels saved to labels.json'
  end

  def self.load_labels
    if File.exist?('labels.json')
      labels_file = File.read('labels.json')
      labels = JSON.parse(labels_file)
      count = all.count
      puts all.count
      puts labels.count
      labels.each do |label|
        new(title: label['title'])
        puts "New Label: #{label['title']}"
      end
      puts all.count
      puts labels.count
    end
    puts 'labels loaded'
  end

  def self.display
    puts all.count
    all.each do |label|
      puts "#{label.title}"
      puts '-----------------'
    end
  end
end
