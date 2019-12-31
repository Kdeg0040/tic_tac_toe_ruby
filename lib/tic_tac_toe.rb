class TicTacToe
  attr_reader :board

  def initialize
    @board = [nil, nil, nil,
              nil, nil, nil,
              nil, nil, nil]
  end

  def move(x_o, pos)
    raise "Invalid character" if x_o != "X" && x_o != "O"
    @board[pos] = x_o
  end
end
