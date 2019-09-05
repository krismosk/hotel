require_relative 'hotel'
module HotelSystem
  class Room
    attr_reader :room_number, :cost, :reservations
    def initialize(room_number:, cost:)
      @room_number = room_number
      @cost = cost
      @reservations = []
    end
    
    
  end 
  
  
  
end