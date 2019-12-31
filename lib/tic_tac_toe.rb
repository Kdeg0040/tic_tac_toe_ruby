class TicTacToe
  attr_reader :board

  def initialize
    @board = [nil, nil, nil,
              nil, nil, nil,
              nil, nil, nil]
  end

  def move(x_o, pos)
    @board[pos] = x_o
  end
end
