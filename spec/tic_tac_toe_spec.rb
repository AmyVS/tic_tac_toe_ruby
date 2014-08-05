require 'rspec'
require 'game'
require 'board'
require 'space'
require 'player'

describe Player do
  it 'is initialized with a name and a symbol' do
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
