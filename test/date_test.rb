require_relative 'test_helper'

describe "Date class" do 
  describe "Date instantiation" do 
    before do
      @date = HotelSystem::Date.new
    end 
    
    it "is an instance of Date" do
      expect(@date).must_be_kind_of HotelSystem::Date
    end
    
    
    
  end 
end