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
    raise "Invalid move, out of bounds" unless pos.between?(0, 8)
  end
end
