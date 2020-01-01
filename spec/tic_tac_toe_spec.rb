require "./lib/tic_tac_toe"

describe "tic tac toe" do
  let(:ttt) { ttt = TicTacToe.new }

  before(:each) do
    allow($stdout).to receive(:puts)
  end

  it "allows an X to be placed on the 3x3 board" do
    ttt.move("X", 1)
    expect(ttt.board).to include("X")
  end

  describe "raises an error" do
    it "if not X or O" do
      expect{ ttt.move("Y", 0) }.to raise_error("Invalid character")
    end

    it "if placing move out of bounds" do
      expect{ ttt.move("X", 9) }.to raise_error("Out of bounds")
      expect{ ttt.move("X", -1) }.to raise_error("Out of bounds")
    end

    it "if position is already taken" do
      ttt.move("X", 1)
      expect{ ttt.move("O", 1) }.to raise_error("Position already taken")
    end

    it "if move out of turn" do
      ttt.move("X", 1)
      expect{ ttt.move("X", 2) }.to raise_error("Invalid move - next player's turn")
    end
  end

  describe "detects a win" do
    it "on top row" do
      ttt.board = ["X", "X", "X", nil, nil, nil, nil, nil, nil]
      ttt.last_move = "X"
      expect(ttt.win?).to eq(true)
    end

    it "on middle row" do
      ttt.board = [nil, nil, nil, "X", "X", "X", nil, nil, nil]
      ttt.last_move = "X"
      expect(ttt.win?).to eq(true)
    end

    it "on bottom row" do
      ttt.board = [nil, nil, nil, nil, nil, nil, "X", "X", "X"]
      ttt.last_move = "X"
      expect(ttt.win?).to eq(true)
    end
  end

  let(:left_col) { left_col = TicTacToe.new }
  let(:middle_col) { middle_col = TicTacToe.new }
  let(:right_col) {right_col = TicTacToe.new }

  it "can detect a winning column" do
    left_col.board = ["O", nil, nil, "O", nil, nil, "O", nil, nil]
    left_col.last_move = "O"

    middle_col.board = [nil, "O", nil, nil, "O", nil, nil, "O", nil]
    middle_col.last_move = "O"

    right_col.board = [nil, nil, "O", nil, nil, "O", nil, nil, "O"]
    right_col.last_move = "O"

    expect(left_col.win?).to eq(true)
    expect(middle_col.win?).to eq(true)
    expect(right_col.win?).to eq(true)
  end

  let(:left_diag) { left_diag = TicTacToe.new }
  let(:right_diag) { right_diag = TicTacToe.new }

  it "can detect diagonal wins" do
    left_diag.board = ["O", nil, nil, nil, "O", nil, nil, nil, "O"]
    left_diag.last_move = "O"

    right_diag.board = [nil, nil, "O", nil, "O", nil, "O", nil, nil]
    right_diag.last_move = "O"

    expect(left_diag.win?).to eq(true)
    expect(right_diag.win?).to eq(true)
  end

  it "can output the winner to the user" do
    ttt.move("X", 0)
    ttt.move("O", 3)
    ttt.move("X", 1)
    ttt.move("O", 4)
    allow(ttt).to receive(:puts).and_return("Game Over - X Wins!")
    expect(ttt.move("X", 2)).to eq("Game Over - X Wins!")
  end
end
