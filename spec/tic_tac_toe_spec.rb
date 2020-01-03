require "./lib/tic_tac_toe"

describe "tic tac toe" do
  let(:ttt) { ttt = TicTacToe.new }

  before(:each) do
    allow($stdout).to receive(:write)
  end

  it "allows an X to be placed on the 3x3 board" do
    ttt.move("X", 2)
    expect(ttt.board).to include("X")
  end

  describe "raises an error" do
    it "if not X or O" do
      expect{ ttt.move("Y", 1) }.to raise_error("Invalid character")
    end

    it "if placing move out of bounds" do
      expect{ ttt.move("X", 10) }.to raise_error("Out of bounds")
      expect{ ttt.move("X", -1) }.to raise_error("Out of bounds")
    end

    it "if position is already taken" do
      ttt.move("X", 2)
      expect{ ttt.move("O", 2) }.to raise_error("Position already taken")
    end

    it "if move out of turn" do
      ttt.move("X", 2)
      expect{ ttt.move("X", 3) }.to raise_error("Invalid move - next player's turn")
    end
  end

  describe "detects a win" do
    context "on a row" do
      it "top" do
        ttt.board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
        ttt.last_move = "X"
        expect(ttt.win?).to eq(true)
      end

      it "middle" do
        ttt.board = [" ", " ", " ", "X", "X", "X", " ", " ", " "]
        ttt.last_move = "X"
        expect(ttt.win?).to eq(true)
      end

      it "bottom" do
        ttt.board = [" ", " ", " ", " ", " ", " ", "X", "X", "X"]
        ttt.last_move = "X"
        expect(ttt.win?).to eq(true)
      end
    end

    context "on a column" do
      it "left" do
        ttt.board = ["O", " ", " ", "O", " ", " ", "O", " ", " "]
        ttt.last_move = "O"
        expect(ttt.win?).to eq(true)
      end

      it "middle" do
        ttt.board = [" ", "O", " ", " ", "O", " ", " ", "O", " "]
        ttt.last_move = "O"
        expect(ttt.win?).to eq(true)
      end

      it "right" do
        ttt.board = [" ", " ", "O", " ", " ", "O", " ", " ", "O"]
        ttt.last_move = "O"
        expect(ttt.win?).to eq(true)
      end
    end

    context "on a diagonal" do
      it "left to right" do
        ttt.board = ["O", " ", " ", " ", "O", " ", " ", " ", "O"]
        ttt.last_move = "O"
        expect(ttt.win?).to eq(true)
      end

      it "right to left" do
        ttt.board = [" ", " ", "O", " ", "O", " ", "O", " ", " "]
        ttt.last_move = "O"
        expect(ttt.win?).to eq(true)
      end
    end
  end

  it "can output the winner to the user" do
    ttt.move("X", 1)
    ttt.move("O", 4)
    ttt.move("X", 2)
    ttt.move("O", 5)
    allow(ttt).to receive(:print).and_return("Game Over - X Wins!")
    expect(ttt.move("X", 3)).to eq("Game Over - X Wins!")
  end

  it "can print the game board" do
    ttt.board = ["X", " ", "O", "O", " ", " ", "X", " ", "X"]
    op = "\n X |   | O \n-----------\n O |   |   \n-----------\n X |   | X \n\n"
    expect { ttt.print_board }.to output(op).to_stdout
  end

  it "can declare a tie game" do
    ttt.board = ["X", "X", "O", "O", "O", "X", "X", "O", " "]
    allow(ttt).to receive(:print).and_return("Tie Game!")
    expect(ttt.move("X", 9)).to eq("Tie Game!")
  end
end
