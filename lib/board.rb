require_relative 'ship'
# comment for Adrian
class Board

  attr_reader :ship_array, :shot

  def initialize
    @ship_array = []
    @shot = []
  end

  def receive_ship(ship)
    ship_array << ship
  end

  def status
    sunk? ? "Game Over" : "Still in the game"
  end

  def receive_hit
    ship_array.each do |ship|
      if ship.position == shot[0]
        ship.hit
        ship.sunk
        ship_array.delete ship
        shot.clear
        return "Hit"
      else
        shot.clear
        return "Missed"
      end
    end
  end

  def sunk?
    ship_array.empty?
  end

end
