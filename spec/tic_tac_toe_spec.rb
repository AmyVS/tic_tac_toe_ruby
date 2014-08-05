require 'rspec'
require 'game'
require 'board'
require 'space'
require 'player'

describe Player do
  it 'is initialized with a name' do
    test_player = Player.new({:name => 'Cindy'})
    expect(test_player).to be_an_instance_of Player
    expect(test_player.name).to eq "Cindy"
  end

  it 'assigns a symbol to each player' do
    test_player1 = Player.new({:name => 'Cindy'})
    test_player2 = Player.new({:name => 'Amy'})
    expect(test_player1.name).to eq "Cindy"
    expect(test_player1.add_symbol({:symbol=>'X'})).to eq 'X'
    expect(test_player2.name).to eq "Amy"
    expect(test_player2.add_symbol({:symbol=>'O'})).to eq 'O'
  end
end

describe Space do
  it "is initialized with its x and y coordinates" do
    test_space = Space.new({:x_coordinate=>0,:y_coordinate=>0})
    expect(test_space).to be_an_instance_of Space
    expect(test_space.x_coordinate).to eq 0
    expect(test_space.y_coordinate).to eq 0
  end

  it 'is marked by a player' do
    test_player1 = Player.new({:name => 'Cindy'})
    test_player1.add_symbol({:symbol=>'X'})
    test_space = Space.new({:x_coordinate=>0,:y_coordinate=>0})
    test_space.marked_by(test_player1)
    expect(test_space.player.name).to eq 'Cindy'
    expect(test_space.player.symbol).to eq 'X'
  end

  it "returns true if it is marked by a player" do
    test_player1 = Player.new({:name => 'Cindy'})
    test_player1.add_symbol({:symbol=>'X'})
    test_space = Space.new({:x_coordinate=>0,:y_coordinate=>0})
    test_space.marked_by(test_player1)
    expect(test_space.player.name).to eq 'Cindy'
    expect(test_space.player.symbol).to eq 'X'
    expect(test_space.isMarked?).to eq true
  end
end

describe Board do
  it 'is initialized with a 3x3 grid of spaces' do
    test_board = Board.new
    test_space = Space.new({:x_coordinate=>0,:y_coordinate=>0})
    expect(test_board).to be_an_instance_of Board
    expect(test_board.all_spaces[0][0].x_coordinate).to eq test_space.x_coordinate
    expect(test_board.all_spaces[0][0].y_coordinate).to eq test_space.y_coordinate
  end
end

describe Game do
  it "is initialized with an empty player array and a board" do
    test_game = Game.new
    test_board = Board.new
    expect(test_game).to be_an_instance_of Game
    expect(test_game.players).to eq []
    expect(test_game.board.all_spaces[0][0].x_coordinate).to eq test_board.all_spaces[0][0].x_coordinate
    expect(test_game.board.all_spaces[0][0].y_coordinate).to eq test_board.all_spaces[0][0].y_coordinate
  end

  it "assigns 2 players to each game" do
    test_player1 = Player.new({:name => 'Cindy'})
    test_player2 = Player.new({:name => 'Amy'})
    test_game = Game.new
    test_game.add_player(test_player1)
    test_game.add_player(test_player2)
    expect(test_game.players[0].name).to eq "Cindy"
    expect(test_game.players[1].name).to eq "Amy"
  end
end
