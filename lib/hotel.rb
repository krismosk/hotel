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
      reservation_id = rand(100..1000)
      reservation = HotelSystem::Reservation.new(reservation_id: reservation_id, start_date: start_date, end_date: end_date)
      
      
      # it will add the start_date & end_date to the reservation start_date, end_date
      # call find_available_rooms here to assign a room
      # find_available_rooms will return a list of available rooms
      # pick the first room from that list and assign it to the reservation 
      # 
      
    end 
    
    def add_reservation(reservation)
      # Will take an instance of reservation and add it to 
      # it's list of reservations
      
      # it will add a reservation to the Room's list of reservations
    end
    
    
    def find_reservation(date)
      # Wave 1
    end 
    
    def find_available_rooms(date_range)
      # Give me a room that doesn't have this date reserved 
      
    end
    
  end 
end