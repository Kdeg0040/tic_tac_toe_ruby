class TicTacToe
  attr_accessor :board, :last_move

  def initialize
    @board = [nil, nil, nil,
              nil, nil, nil,
              nil, nil, nil]
    @last_move = nil
  end

  def move(x_o, pos)
    valid?(x_o, pos)
    @board[pos] = x_o
    @last_move = x_o
  end

  def win?
    @board[0..2].all?(@last_move) || @board[3..5].all?(@last_move) || @board[6..8].all?(@last_move)
  end

  def valid?(x_o, pos)
    raise "Invalid character" unless ["X", "O"].include?(x_o)
    raise "Out of bounds" unless pos.between?(0, 8)
    raise "Position already taken" unless @board[pos] == nil
    raise "Invalid move - next player's turn" if x_o == @last_move
  end
end
