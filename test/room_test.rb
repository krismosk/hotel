require_relative 'test_helper'

describe "Room class" do 
  def build_room
    return HotelSystem::Room.new(room_number: 1, cost: 200)
  end
  
  describe "Initializer" do
    it "is an instance of Room" do 
      room = build_room
      expect(room).must_be_kind_of HotelSystem::Room
    end

    it "establishes the base data structures when instantiated" do
      room = build_room
      [:room_number, :cost, :reservations].each do |attribute|
        expect(room).must_respond_to attribute
      end
      
      expect(room.room_number).wont_be_nil
      expect(room.cost).must_equal 200
      expect(room.reservations).must_be_kind_of Array
    end
  end
end 