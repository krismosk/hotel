require_relative 'test_helper'

describe "Hotel class" do 
  describe "Hotel instantiation" do
    before do
      @hotel = HotelSystem::Hotel.new(20)
    end
    
    it "is an instance of Hotel" do 
      expect(@hotel).must_be_kind_of HotelSystem::Hotel
    end
    
    it "will create the correct number of rooms" do
      @hotel.create_rooms
      p @hotel.rooms
      expect(@hotel.rooms.length).must_equal 20
    end 
    
    
  end
  
  
  
end