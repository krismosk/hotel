require_relative 'hotel'
module HotelSystem
  class Room
    attr_reader :room_number, :dates_reserved
    def initialize(room_number)
      @room_number = room_number
      @reservation_dates = []
    end
    
    
  end 
  
  
  
end