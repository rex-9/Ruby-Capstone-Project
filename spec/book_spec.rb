require_relative '../label'
require_relative '../book'

describe Book do
  before(:each) do
    # @book = Book.new(publisher:'The Hobbit', published_date: '21-09-1937', )
  end

  describe '#new' do
    context 'When creating a new book' do
      it 'should return a Book object' do
        expect(@book).to be_an_instance_of Book
      end

      it 'should return a correct title' do
        expect(@book.title).to eq 'The Hobbit'
      end

      it 'should return a correct author' do
        expect(@book.author).to eq 'J.R.R. Tolkien'
      end

      it 'should return a correct published_date' do
        expect(@book.published_date).to eq '21-09-1937'
      end
    end
  end
end