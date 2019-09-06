require_relative 'test_helper'

describe "Reservation class" do 
  before do
    @room = HotelSystem::Room.new(room_number: 1, cost: 200)
    @reservation = HotelSystem::Reservation.new(reservation_id: 101, room: @room, start_date: Date.parse("20190320"), end_date: Date.parse("20190325"))
  end
  
  describe "Reservation instantiation" do
    it "is an instance of Reservation" do 
      expect(@reservation).must_be_kind_of HotelSystem::Reservation
    end
    
    it "knows it's reservation number" do
      expect(@reservation.reservation_id).wont_be_nil
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
end