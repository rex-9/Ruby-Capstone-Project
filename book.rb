require_relative 'item'
require 'json'

class Book < Item
  attr_reader :published_date, :publisher, :cover_state, :label

  def initialize(publisher:, cover_state:, published_date:, label:)
    @publisher = publisher
    @cover_state = cover_state
    @label = label
    super(published_date: published_date)
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def self.save
    books = []
    all.each do |book|
      books << {
        id: book.id,
        publisher: book.publisher,
        published_date: book.published_date,
        label: {
          id: book.label.id,
          title: book.label.title,
          color: book.label.color
        },
        cover_state: book.cover_state
      }
    end

    File.write('book.json', JSON.pretty_generate(books))
    'Book saved to book.json'
  end

  def self.load_books
    return unless File.exist?('book.json')

    books_file = File.read('book.json')
    books = JSON.parse(books_file)
    books.each do |book|
      new(
        publisher: book['publisher'],
        published_date: book['published_date'],
        label: Label.new(title: book['label']['title'], color: book['label']['color']),
        cover_state: book['cover_state']
      )
    end
  end
end
