require 'player.rb'

describe Player do

  it 'responds to place method with argument of ship' do
    expect(subject).to respond_to(:place).with(1).argument
  end

  it 'places ships onto the board' do
   ship = Ship.new "A1"
   expect(subject.place(ship)).to eq(subject.board.ship_array)
 end

  it 'tells board to receive hit' do
    ship = Ship.new "A1"
    subject.place ship
    expect(subject.fire("A1")).to eq("Hit")
  end

  it 'reports that player has lost' do
    p1 = Player.new
    ship = Ship.new "A1"
    p1.place ship
    p1.fire "A1"
    is_expected.to be_lost
  end
end
