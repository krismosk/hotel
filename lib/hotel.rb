require_relative 'room'
require_relative 'reservation'
require_relative 'date'

module HotelSystem
  class Hotel
    attr_reader :rooms, :reservations
    attr_accessor :amount_of_rooms
    
    def initialize(amount_of_rooms)
      @amount_of_rooms = amount_of_rooms
      @rooms = []
      @reservations = []
    end
    
    def create_rooms
      # room_number = 0
      @amount_of_rooms.times do
        room = HotelSystem::Room.new
        # room_number += 1
        rooms.push(room)
      end
      
      
    end
    
  end 
end