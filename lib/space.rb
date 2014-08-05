class Space
  attr_reader :x_coordinate, :y_coordinate

  def initialize(attributes)
    @x_coordinate = attributes[:x_coordinate]
    @y_coordinate = attributes[:y_coordinate]
  end
end
