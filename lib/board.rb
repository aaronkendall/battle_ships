require_relative 'ship'
# comment for Usman
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
    if ship_array.count == 1 && ship.position.length == 2 && ship.position == shot[0]
      final_hit(ship)
      return "Hit! Game over!"

    elsif ship.position == shot[0]
      pos_hit(ship)
      return "Hit"

    else
        shot.clear
        return "Missed"
      end
    end
  end

  private

  def final_hit(ship)
    ship.hit
    ship.sunk
    ship_array.delete ship
    shot.clear
  end

  def pos_hit(ship)
    ship.hit
    ship.sunk
    ship_array.delete ship
    shot.clear
  end

  def sunk?
    ship_array.empty?
  end
end
