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
    puts 'Add book to library'
    puts 'Enter Label'
    label = gets.chomp
    puts 'Enter Author'
    author = gets, chomp
    puts 'Enter Publisher'
    publisher = gets.chomp
    puts 'Enter publish date:'
    published_date = gets.chomp
    puts 'Enter Book Genre'
    genre = gets.chomp
    puts 'Enter Source '
    source = gets.chomp
    puts 'is cover state "bad" or "good"'
    cover_state = gets.chomp
    if File.exist?('book.json')
      books_file = File.read('book.json')
      books = JSON.parse(books_file)
      books << {
        id: id,
        label: label.name,
        author: "#{author.first_name} #{author.last_name}",
        publisher: publisher,
        published_date: published_date
        genre: genre.name,
        source: source.name,
        cover_state: cover_state,
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
      puts "id: #{book['id']}
      author: #{book['author']}
      source: #{book['source']}
      publisher: #{book['publisher']}
      cover_state: #{book['cover_state']}
      label: #{book['label']}
      genre: #{book['genre']}
      "
    end
    puts 'no books exist'
  end
end
