require_relative 'item'
require 'json'

class Book < Item
  attr_reader :published_date, :publisher, :cover_state

  def initialize(publisher:, cover_state:, published_date:)
    @publisher = publisher
    @cover_state = cover_state
    super(published_date: published_date)
  end

  def can_be_archived?
    super || cover_state == 'bad'
  end

  def save
    if File.exist?('book.json')
      books_file = File.read('book.json')
      books = JSON.parse(books_file)
      books << {
        id: id,
        publisher: publisher,
        cover_state: cover_state,
        genre: genre.name,
        author: "#{author.first_name} #{author.last_name}",
        source: source.name,
        label: label.name,
        published_date: published_date
      }

      File.write('book.json', JSON.pretty_generate(books))
      'Book saved to book.json'
    else
      File.write('book.json', JSON.pretty_generate([{
                                                     id: id,
                                                     publisher: publisher,
                                                     cover_state: cover_state,
                                                     genre: genre.name,
                                                     author: "#{author.first_name} #{author.last_name}",
                                                     source: source.name,
                                                     label: label.name,
                                                     published_date: published_date
                                                   }]))
    end
  end

  def self.load_books
    return unless File.exist?('book.json')

    books_file = File.read('book.json')
    books = JSON.parse(books_file)
    books.each do |book|
      puts "id: #{book['id']}"
    end
    puts 'no books exist'
  end
end
