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
        room = HotelSystem::Room.new(room_number)
        rooms.push(room)
      end
      
    end
    
    def make_reservation(start_date, end_date)
      reservation_id = 0
      # 
      reservation = HotelSystem::Reservation.new
    end 
    
    def add_reservation(reservation)
      # Will take an instance of reservation and add it to 
      # it's list of reservations
    end
    
    
    def find_reservation(date)
      
    end 
    
    def find_available_rooms(date_range)
      
      
    end
    
  end 
end