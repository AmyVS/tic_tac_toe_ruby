class Board

  attr_reader :all_spaces

  def initialize
    @all_spaces = []
    for input_x_coord in 0..2 do
      @board_row = []
      for input_y_coord in 0..2 do
        @board_row << Space.new({ :x_coordinate=>input_x_coord, :y_coordinate=>input_y_coord} )
      end
      @all_spaces << @board_row
    end
  end

end
