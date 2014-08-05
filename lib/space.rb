class Space
  attr_reader :x_coordinate, :y_coordinate, :player

  def initialize(attributes)
    @x_coordinate = attributes[:x_coordinate]
    @y_coordinate = attributes[:y_coordinate]
    @player = nil
  end

  def marked_by (player) # marks the space with the player
    @player = player
  end

  def is_marked? # determines if the space is marked by anyone
    if @player == nil
      return false
    else
      return true
    end
  end

  def is_marked_by # returns who marked the space
    @player
  end
end
