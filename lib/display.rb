# frozen_string_literal: true

# Displays the game on the console
module Display
  def display_rules(pieces)
    puts <<-HEREDOC
  Connect four is a two player game.
  Each turn a player will chose one of seven columns to drop a Piece.
  Player 1 will start the game and has the #{pieces[0]} pieces.
  Player 2 has the #{pieces[1]} pieces.
    HEREDOC
  end

  def display_board(board)
    (0..5).each do |row|
      (0..6).each do |column|
        if board[column][row].nil?
          print "\e[30m\u25EF\e[0m "
        else
          print "#{board[column][row]} "
        end
      end
      puts
    end
  end

  def display_current_round(player)
    puts "/n It's your turn #{player}! Choose a column to drop a piece"
  end

  def display_player_name(player_number)
    puts "Hello Player #{player_number}, what's your name?"
  end
end
