require "./lib/tic_tac_toe"

describe "tic tac toe" do
  let(:ttt) { ttt = TicTacToe.new }

  it "allows an X to be placed on the 3x3 board" do
    ttt.move("X", 1)
    expect(ttt.board).to include("X")
  end

  it "raises an error if not X or O" do
    expect{ ttt.move("Y", 0) }.to raise_error("Invalid character")
  end

  it "raises an error if placing move out of bounds" do
    expect{ ttt.move("X", 9) }.to raise_error("Out of bounds")
    expect{ ttt.move("X", -1) }.to raise_error("Out of bounds")
  end

  it "raises an error if position is already taken" do
    ttt.move("X", 1)
    expect{ ttt.move("O", 1) }.to raise_error("Position already taken")
  end

  it "enforces alternating moves" do
    ttt.move("X", 1)
    expect{ ttt.move("X", 2) }.to raise_error("Invalid move - next player's turn")
  end

  let(:top_row) { top_row = TicTacToe.new }
  let(:middle_row) { middle_row = TicTacToe.new }
  let(:bottom_row) { bottom_row = TicTacToe.new }


  it "can detect a winning row" do
    top_row.board = ["X", "X", "X", nil, nil, nil, nil, nil, nil]
    top_row.last_move = "X"

    middle_row.board = [nil, nil, nil, "X", "X", "X", nil, nil, nil]
    middle_row.last_move = "X"
    
    expect(top_row.win?).to eq(true)
    expect(middle_row.win?).to eq(true)
  end
end
