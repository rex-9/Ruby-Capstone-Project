require_relative 'spec_helper'

describe Game do
  before(:each) do
    genre = Genre.new('Action')
    author = Author.new('Hideaki', 'Miyazaki')
    source = Source.new('Steam')
    label = Label.new('Elden Ring', 'Golden')
    @game = Game.new(
      multiplayer: true,
      last_played_at: Time.now,
      published_date: '18-03-2000')
  end

  describe '#new' do
    context 'When creating a new game' do
      it 'should return a Game object' do
        expect(@game).to be_an_instance_of Game
      end

      it 'should return a correct published_date' do
        expect(@game.published_date).to eq '18-03-2000'
      end

      it 'should return a correct multiplayer' do
        expect(@game.multiplayer).to eq true
      end

      it 'should return a correct genre' do
        expect(@game.genre.name).to eq 'Action'
      end

      it 'should return a correct author' do
        expect(@game.author.first_name).to eq 'Hideaki'
      end

      it 'should return a correct source' do
        expect(@game.source.name).to eq 'Steam'
      end

      it 'should return a correct label' do
        expect(@game.label.title).to eq 'Elden Ring'
      end
    end
  end
end
