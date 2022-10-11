require_relative './spec_helper'

describe Game do
  before(:each) do
    @author = Author.new('Hideaki', 'Miyazaki')
    @game = Game.new(multiplayer: true, last_played_at: '18-03-2020', published_date: '18-03-2000')
    @author.add_item(@game)
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
    end
  end

  describe 'add to author' do
    it 'should return a correct author' do
      expect(@author.items.first).to eq @game
    end
  end
end
