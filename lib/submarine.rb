require_relative 'ship'

class Submarine < Ship

  def initialize(position,orientation)
    super(position)
    @size = 5
    @orientation = orientation
    @board_position = []
  end

  def face_north
    array = @position.split(//)
    new_coords = (array[0].ord - 1).chr + array[1] + @position
    @board_position << new_coords.scan(/../)
    @board_position.flatten
    end

  end


sub = Submarine.new("J1", :N)

p sub.face_north
