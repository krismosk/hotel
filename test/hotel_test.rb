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
      expect(@hotel.make_reservation(start_date, end_date)).must_be_kind_of HotelSystem::Reservation
    end
    
    # it "will require start_date and end_date to be entered YYYYMMDD" do
    #   start_date = Date.parse("20190322")
    #   p start_date
    #   end_date = Date.parse("03232019")
    #   p end_date
    
    #   # # @hotel.make_reservation(start_date, end_date)
    #   # expect do
    #   #   @hotel.make_reservation(start_date, end_date)
    #   # end.must_raise ArgumentError
    # end
    
    it "raises an error for end_date being earlier than start_date" do
      start_date = Date.new(2019,03,22)
      end_date = Date.new(2019,03,20)
      expect do
        @hotel.make_reservation(start_date, end_date)
      end.must_raise ArgumentError
    end
    
    it "raises an error for start_date and end_date being the same day" do
      start_date = Date.new(2019,03,22)
      end_date = Date.new(2019,03,22)
      expect do
        @hotel.make_reservation(start_date, end_date)
      end.must_raise ArgumentError
    end
    
    
    
    
  end 
  
  
  
end