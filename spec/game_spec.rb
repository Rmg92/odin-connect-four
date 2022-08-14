# frozen_string_literal: true

require './lib/game'

describe Game do
  describe '#create_players' do
    subject(:create_players) { described_class.new }

    before do
      allow(create_players).to receive(:puts)
      allow(create_players).to receive(:gets).and_return('Jarvis')
      create_players.create_players
    end

    it 'assigns Jarvis as player 1 name' do
      expect(create_players.instance_variable_get(:@player_one).name).to eq('Jarvis')
    end

    it "returns \u26AA as player 1 piece" do
      expect(create_players.instance_variable_get(:@player_one).piece).to eq("\u26AA")
    end

    it 'returns Jarvis as player 2 name' do
      expect(create_players.instance_variable_get(:@player_two).name).to eq('Jarvis')
    end

    it "returns \u26AB as player 2 piece" do
      expect(create_players.instance_variable_get(:@player_two).piece).to eq("\u26AB")
    end
  end
end
