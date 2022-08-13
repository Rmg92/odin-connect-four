# frozen_string_literal: true

require './lib/board'

describe Board do
  subject(:new_board) { described_class.new }
  let(:board) { new_board.instance_variable_get(:@board) }

  it 'returns an array of length 7 columns' do
    expect(board.length).to eq(7)
  end

  it 'returns an array of length 6 rows' do
    expect(board[0].length).to eq(6)
  end
end
