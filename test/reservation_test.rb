require_relative 'test_helper'

describe "Reservation class" do 
  describe "Reservation instantiation" do
    before do
      @reservation = HotelSystem::Reservation.new(101)
    end
    
    it "is an instance of Reservation" do 
      expect(@reservation).must_be_kind_of HotelSystem::Reservation
    end
    
    it "knows it's room number" do
      expect(@reservation.reservation_id).wont_be_nil
    end
    
  end
  
  
  
end