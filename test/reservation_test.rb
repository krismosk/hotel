require_relative 'test_helper'

describe "Reservation class" do 
  before do
    @room = HotelSystem::Room.new(room_number: 1, cost: 200)
    @reservation = HotelSystem::Reservation.new(room: @room, start_date: Date.parse("20190320"), end_date: Date.parse("20190325"))
  end
  
  describe "Reservation instantiation" do
    it "is an instance of Reservation" do 
      expect(@reservation).must_be_kind_of HotelSystem::Reservation
    end
    
    it "will contain an instance of its assigned Room" do
      expect(@reservation.room).must_be_kind_of HotelSystem::Room
    end
    
    it "will contain a date range" do 
      expect(@reservation.date_range).must_be_kind_of Range
    end
  end
  
  describe "Calculate duration of stay" do
    it "will return the total duration of the reservation" do 
      expect(@reservation.calculate_stay_duration).must_equal 5
    end 
  end
  
  describe "Calculate total cost" do
    it "will return the total cost of the reservation" do 
      expect(@reservation.calculate_total_cost).must_equal 1000
    end
  end
  
  describe "#check_for_overlap" do
    it "will return false if the dates do not overlap" do 
      hotel = HotelSystem::Hotel.new(1)
      hotel.create_rooms
      expect(HotelSystem::Reservation.check_for_overlap((Date.new(2019,03,26)..Date.new(2019,03,28)), (Date.new(2019,03,20)..Date.new(2019,03,25)))).must_equal false
    end
  end
  
  
end