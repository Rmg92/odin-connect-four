# frozen_string_literal: true

# Displays the game on the console
module Display
  def display_rules
    puts <<-HEREDOC
  Connect four is a two player game.
  Each turn a player will chose one of seven columns to drop a Piece.
  Player 1 will start the game and has the \u26AA pieces.
  Player 2 has the \u26AB pieces.
    HEREDOC
  end
end
