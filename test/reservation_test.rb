require_relative 'test_helper'

describe "Reservation class" do 
  describe "Reservation instantiation" do
    before do
      # start_date = Date.new(2019,03,22)
      # end_date = Date.new(2019,03,25)
      @reservation = HotelSystem::Reservation.new(reservation_id: 101, start_date: Date.new(2019,03,25), end_date: Date.new(2019,03,25))
    end
    
    it "is an instance of Reservation" do 
      expect(@reservation).must_be_kind_of HotelSystem::Reservation
    end
    
    it "knows it's reservation number" do
      p "Kristina"
      p @reservation.reservation_id
      expect(@reservation.reservation_id).wont_be_nil
    end
    
    # it "will contain an instance of its assigned Room" do
    #   expect(@reservation.room).must_be_kind_of HotelSystem::Room
    # end
    
  end
  
  describe "Calculate duration of stay" do
    it "will return the total duration of the reservation" do 
      
      
    end 
    
    
    
    
  end
  
  
  
end