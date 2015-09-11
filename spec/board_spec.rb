require 'board.rb'
# comment for Adrian
describe Board do

  it 'should respond to receive_ship' do
    is_expected.to respond_to(:receive_ship).with(1).argument
  end

  it 'should have an instance of ship on board' do
    ship1 = Ship.new "A1"
    subject.receive_ship(ship1)
    expect(subject.ship_array).to include(ship1)
  end

  it 'Reports missed when no ship in position targetted' do
    ship = Ship.new('A1')
    p1 = Player.new
    p1.place(ship)
    p1.fire("A2")
    expect(p1.board.receive_hit).to eq("Missed")
  end

  it 'Reports Hit when ship in position targetted' do
    ship = Ship.new('A1')
    ship2 = Ship.new('A2')
    p1 = Player.new
    p1.board.ship_array << ship
    p1.board.ship_array << ship2
    expect(p1.fire("A1")).to eq("Hit")
  end

  it 'Updates damage on the ship when hit' do
    ship = Ship.new('A1')
    p1 = Player.new
    p1.board.ship_array << ship
    p1.fire('A1')
    p1.board.receive_hit
    expect(ship.damage).to eq(1)
  end

  it 'Reports that not all ships are sunk' do
    ship = Ship.new('A1')
    subject.ship_array << ship
    expect(subject.status).to eq("Still in the game")
  end

  it 'tells you when game over without calling status' do
    p1 = Player.new
    ship1 = Ship.new "A1"
    p1.place(ship1)
    ship2 = Ship.new "A2"
    p1.place(ship2)
    p1.fire('A1')
    expect(p1.fire('A2')).to eq "Hit! Game over!"
  end
end
