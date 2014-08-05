require 'rspec'
require 'game'
require 'board'
require 'space'
require 'player'

describe Player do
  it 'is initialized with a name' do
    test_player = Player.new({:name => 'Jane Smith'})
    expect(test_player).to be_an_instance_of Player
  end
end

describe Space do
  it "is initialized with its x and y coordinates" do
    test_space = Space.new({:x_coordinate=>0,:y_coordinate=>0})
    expect(test_space).to be_an_instance_of Space
    expect(test_space.x_coordinate).to eq 0
    expect(test_space.y_coordinate).to eq 0
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
end
