require_relative 'test_helper'

describe "Room class" do 
  before do
    @room = HotelSystem::Room.new(room_number:, cost:)
  end
  
  describe "Room instantiation" do
    it "is an instance of Room" do 
      expect(@room).must_be_kind_of HotelSystem::Room
    end
    
    it "knows it's room rate" do
      expect(@room.cost).must_equal 200
    end
    
    it "knows it's room number" do 
      expect(@room.room_number).wont_be_nil
    end

    it "is an array that stores reservations if they exist" do
      expect(@room.reservations).must_be_kind_of Array
    end
  end
end