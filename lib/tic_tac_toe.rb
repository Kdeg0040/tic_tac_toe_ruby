class TicTacToe
  attr_reader :board

  def initialize
    @board = [nil, nil, nil,
              nil, nil, nil,
              nil, nil, nil]
  end

  def move(x_o, pos)
    raise "Invalid character" if !valid?(x_o)
    @board[pos] = x_o
  end

  def valid?(x_o)
    ["X", "O"].include?(x_o)
  end
end
