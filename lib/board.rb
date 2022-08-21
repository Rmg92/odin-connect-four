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
    row = 6
    row -= 1 until (@board[column - 1][row]).nil?
    row
  end
end
