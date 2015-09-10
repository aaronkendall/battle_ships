require 'ship.rb'
# Comment for Adrian
describe Ship do

  it 'has a position when created' do
    ship = Ship.new('A1')
    expect(ship.position).to eq('A1')
  end

  describe "#hits"
    it 'It is initialized with no hits' do
      ship = Ship.new('A1')
      expect(ship.damage).to eq(0)
    end
    it 'Will count hits when recieved' do
      ship = Ship.new('A1')
      ship.hit
      expect(ship.damage).to eq(1)
    end

  it "can be sunk" do
    ship = Ship.new('A1')
    ship.hit
    expect(ship.sunk).to eq("Your ship is sunk")
  end

end
