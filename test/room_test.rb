require_relative 'test_helper'

describe "Room class" do 
  before do
    @room = HotelSystem::Room.new(1)
  end
  
  describe "Room instantiation" do
    it "is an instance of Room" do 
      expect(@room).must_be_kind_of HotelSystem::Room
    end
    
    it "knows it's room number" do 
      expect(@room.room_number).wont_be_nil
    end
  end
  
  describe "Room Reservations" do
    
    
  end
  
  
  
end