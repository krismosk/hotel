require_relative 'room'
require_relative 'reservation'
require_relative 'date'

module HotelSystem
  class Hotel
    attr_reader :rooms, :reservations
    
    def initialize
      @rooms = []
      @reservations = []
    end
    
    
    
    
  end
  
end 