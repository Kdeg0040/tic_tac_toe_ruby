require "./lib/tic_tac_toe"

describe "tic tac toe" do
  it "allows an X to be placed on the 3x3 board" do
    ttt = TicTacToe.new
    ttt.move("X", 1)
    expect(ttt.board).to include("X")
  end

  it "raises an error if not X or O" do
    ttt = TicTacToe.new
    expect{ ttt.move("Y", 0) }.to raise_error("Invalid character")
  end
end
