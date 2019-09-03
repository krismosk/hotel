require_relative 'test_helper'

describe "Reservation class" do 
  describe "Reservation instantiation" do
    before do
      @reservation = HotelSystem::Reservation.new
    end
    
    it "is an instance of Reservation" do 
      expect(@reservation).must_be_kind_of HotelSystem::Reservation
    end
    
    
  end
  
  
  
end