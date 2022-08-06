# frozen_string_literal: true

# player_spec.rb
require './lib/player'

describe Player do
  describe '#initialize' do
    subject(:player) { described_class.new('Player 1', "\u26AA") }

    it 'returns the player name' do
      expect(player.name).to eq('Player 1')
    end

    it 'returns the player piece' do
      expect(player.piece).to eq("\u26AA")
    end
  end
end
