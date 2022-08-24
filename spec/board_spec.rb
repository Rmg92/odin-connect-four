# frozen_string_literal: true

require './lib/board'

describe Board do
  subject(:new_board) { described_class.new }

  describe '#create_board' do
    context 'when board is initialized' do
      it 'returns an array of length 7 columns' do
        expect(new_board.board.length).to eq(7)
      end

      it 'returns an array of length 6 rows' do
        expect(new_board.board[0].length).to eq(6)
      end
    end
  end

  describe '#drop_piece' do
    context 'when the player choses a column' do
      before do
        new_board.drop_piece(3, "\u26AA")
      end

      it 'drops a piece at the end of an empty column' do
        expect(new_board.board[2][5]).to eq("\u26AA")
      end

      it 'drops a piece on top of another piece' do
        new_board.drop_piece(3, "\u26AA")
        expect(new_board.board[2][5]).to eq("\u26AA")
      end
    end
  end
end
