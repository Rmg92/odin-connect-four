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

  describe '#full_column?' do
    let(:full_column_board) { described_class.new }

    before do
      full_column_board.instance_variable_set(:@board, [[1, 2, 3]])
    end

    context 'checks if selected column is full' do
      it 'returns false if column is not full' do
        expect(new_board.full_column?(1)).to eq(false)
      end

      it 'returns true if column is full' do
        expect(full_column_board.full_column?(1)).to eq(true)
      end
    end
  end

  describe '#vertical_connected' do
    let(:column_four_connected) { described_class.new }

    before do
      column_four_connected.instance_variable_set(:@board, [[1, 1, 1, 1, 3]])
    end

    context 'checks if there is four equal pieces vertically connected' do
      it 'returns false if not' do
        expect(new_board.vertical_connected).to eq(false)
      end

      it 'returns true if yes' do
        expect(column_four_connected.vertical_connected).to eq(true)
      end
    end
  end
end
