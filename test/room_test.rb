require_relative 'test_helper'

describe "Room class" do 
  describe "Room instantiation" do
    before do
      @room = HotelSystem::Room.new(1)
    end
    
    it "is an instance of Room" do 
      expect(@room).must_be_kind_of HotelSystem::Room
    end
    
    
  end
  
  
  
end