# frozen_string_literal: true

# Creates a new player
class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end
end
