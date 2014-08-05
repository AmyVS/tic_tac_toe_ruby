class Space
  attr_reader :x_coordinate, :y_coordinate, :player

  def initialize(attributes)
    @x_coordinate = attributes[:x_coordinate]
    @y_coordinate = attributes[:y_coordinate]
  end

  def marked_by (player)
    @player = player
  end

end
