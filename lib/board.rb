# frozen_string_literal: true

# Creates a new board for the game
class Board
  attr_reader :board

  def initialize
    @board = create_board
  end

  def create_board
    Array.new(7) { Array.new(6) }
  end

  def drop_piece(column, piece)
    row = find_empty_row(column)
    @board[column - 1][row] = piece
  end

  def find_empty_row(column)
    row = @board[column - 1].length - 1
    row -= 1 until (@board[column - 1][row]).nil?
    row
  end

  def full_column?(column)
    return true unless @board[column - 1].any?(nil)

    false
  end

  def four_connected?
    return true if vertical_connected?

    false
  end

  def vertical_connected?
    @board.each do |column|
      column.each_with_index do |value, index|
        pieces = [value]
        next if value.nil?

        pieces << column[index + 1]
        pieces << column[index + 2]
        pieces << column[index + 3]
        return true if pieces.all?(value)
      end
    end
    false
  end
end
