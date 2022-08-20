# frozen_string_literal: true

require './lib/game'

describe Game do
  subject(:game) { described_class.new }
  describe '#create_players' do
    context 'when creating player 1' do
      before do
        allow(game).to receive(:puts)
        allow(game).to receive(:gets).and_return('Jarvis')
      end

      it "creates a new player named Jarvis with \u26AA piece" do
        expect(Player).to receive(:new).with('Jarvis', "\u26AA")
        game.new_player(1)
      end
    end

    context 'when creating player 2' do
      before do
        allow(game).to receive(:puts)
        allow(game).to receive(:gets).and_return('Jordan')
      end

      it "creates a new player named Jordan with \u26AB piece" do
        expect(Player).to receive(:new).with('Jordan', "\u26AB")
        game.new_player(2)
      end
    end
  end

  describe '#create_board' do
    before do
      game.create_board
    end

    context 'when creating a new board' do
      it 'creates @board instance variable with a new board' do
        expect(game.instance_variable_get(:@board)).to be_a Board
      end
    end
  end

  describe '#player_drop_input' do
    context 'when receiving a valid input' do
      input = 3
      before do
        allow(game).to receive(:gets).and_return(input)
      end

      it 'returns the input' do
        expect(game.player_drop_input).to eq(input)
      end
    end

    context 'when receiving invalid input' do
      input = 'a'
      before do
        allow(game).to receive(:gets).and_return(input, 2)
      end

      it "ask's for new input" do
        expect(game).to receive(:player_drop_input)
        game.player_drop_input
      end
    end
  end
end
