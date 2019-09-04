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
      expect(@hotel.rooms.length).must_equal 20
    end 
    
    it "will generate a room number for each instance of Room" do
      @hotel.create_rooms
      expect(@hotel.rooms.first.room_number).must_equal 1
    end 
    
  end
  
  describe "Make_Reservation Method" do
    before do
      @hotel = HotelSystem::Hotel.new(20)
    end 
    
    it "will create a new Reservation" do
      start_date = Date.new(2019,03,22)
      end_date = Date.new(2019,03,25)
      new_reservation = @hotel.make_reservation(start_date, end_date)
      expect(new_reservation).must_be_kind_of HotelSystem::Reservation
    end
    
    
    
    
  end 
  
  
  
end