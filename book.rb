# require_relative 'item'
# require 'json'

# class Book < Item
#   attr_reader :published_date, :publisher, :cover_state

#   def initialize(publisher:, cover_state:, published_date:)
#     @publisher = publisher
#     @cover_state = cover_state
#     super(published_date: published_date)
#   end

#   def can_be_archived?
#     super || cover_state == 'bad'
#   end

#   def save
#     if File.exist?('book.json')
#       books_file = File.read('book.json')
#       books = JSON.parse(books_file)
#       books << {
#         id: id,
#         label: label.name,
#         publisher: publisher,
#         published_date: published_date
#         cover_state: cover_state,
#       }

#       File.write('book.json', JSON.pretty_generate(books))
#       'Book saved to book.json'
#     else
#       File.write('book.json', JSON.pretty_generate([{
#                                                      id: id,
#                                                      publisher: publisher,
#                                                      cover_state: cover_state,
#                                                      label: label.name,
#                                                      published_date: published_date
#                                                    }]))
#     end
#   end

#   def self.load_books
#     return unless File.exist?('book.json')

#     books_file = File.read('book.json')
#     books = JSON.parse(books_file)
#     books.each do |book|
#       puts "id: #{book['id']}
#       publisher: #{book['publisher']}
#       cover_state: #{book['cover_state']}
#       label: #{book['label']}
#       "
#     end
#     puts 'no books exist'
#   end
# end
