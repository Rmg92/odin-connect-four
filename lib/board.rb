# frozen_string_literal: true

# Creates a new board for the game
class Board
  def initialize
    @board = create_board
  end

  def create_board
    Array.new(7) { Array.new(6) }
  end
end
