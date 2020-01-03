class TicTacToe
  attr_accessor :board, :last_move

  def initialize
    @board = [" ", " ", " ",
              " ", " ", " ",
              " ", " ", " "]
    @last_move = nil
  end

  def move(x_o, pos)
    valid?(x_o, pos)
    @board[pos - 1] = x_o
    @last_move = x_o
    print_board
    end_game?
  end

  def win?
    winning_combinations.each do |combination|
      return true if combination.all?(@last_move)
    end
    false
  end

  def end_game?
    if win?
      print "Game Over - #{@last_move} Wins!"
    elsif !@board.any?(" ")
      print "Tie Game!"
    end
  end

  def valid?(x_o, pos)
    raise "Invalid character" unless ["X", "O"].include?(x_o)
    raise "Out of bounds" unless pos.between?(1, 9)
    raise "Position already taken" unless @board[pos - 1] == " "
    raise "Invalid move - next player's turn" if x_o == @last_move
  end

  def winning_combinations
    [@board[0..2], @board[3..5], @board[6..8],
    [@board[0], @board[3], @board[6]],
    [@board[1], @board[4], @board[7]],
    [@board[2], @board[5], @board[8]],
    [@board[0], @board[4], @board[8]],
    [@board[2], @board[4], @board[6]]]
  end

  def print_board
    print "\n #{board[0]} | #{board[1]} | #{board[2]} \n"
    print "-----------\n"
    print " #{board[3]} | #{board[4]} | #{board[5]} \n"
    print "-----------\n"
    print " #{board[6]} | #{board[7]} | #{board[8]} \n\n"
  end
end
