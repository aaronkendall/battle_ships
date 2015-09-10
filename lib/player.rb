require_relative 'board'
# Comment for Adrian
class Player

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def place(ship)
    board.receive_ship(ship)
  end

  def fire(co)
    board.shot << co
    board.receive_hit
  end

  def lost?
    board.ship_array.empty?
  end

end

p = Player.new
ship = Ship.new "A1"

p.place ship
p.fire "A1"
