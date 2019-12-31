class TicTacToe
  attr_reader :board

  def initialize
    @board = [nil, nil, nil,
              nil, nil, nil,
              nil, nil, nil]
  end

  def move(x_o, pos)
    valid?(x_o, pos)
    @board[pos] = x_o
  end

  def valid?(x_o, pos)
    raise "Invalid character" unless ["X", "O"].include?(x_o)
    raise "Out of bounds" unless pos.between?(0, 8)
    raise "Position already taken" unless @board[pos] == nil
  end
end
