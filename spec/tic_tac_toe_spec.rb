require "./lib/tic_tac_toe"

describe "tic tac toe" do
  it "allows an X to be placed on the 3x3 board" do
    ttt = TicTacToe.new
    ttt.move('X')
    expect(ttt.board).to include('X')
  end
end
