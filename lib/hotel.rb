require_relative 'room'
require_relative 'reservation'
require_relative 'date_utility'

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
      room_number = 0
      @amount_of_rooms.times do
        room_number += 1 
        # consider injecting a dependency here
        room = HotelSystem::Room.new(room_number)
        rooms.push(room)
      end
      
    end
    
    def add_reservation(reservation)
      # Will take an instance of reservation and add it to 
      # it's list of reservations
    end
    
  end 
end