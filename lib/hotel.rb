require_relative 'room'
require_relative 'reservation'

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
      cost = 200
      room_number = 0
      @amount_of_rooms.times do
        room_number += 1 
        room = HotelSystem::Room.new(room_number: room_number, cost: cost)
        rooms.push(room)
      end
    end
    
    def list_rooms
      rooms.each do |room|
        puts room
      end
      return rooms
    end
    
    def make_reservation(start_date, end_date)
      HotelSystem::Reservation.validate_dates(start_date, end_date)
      
      available_rooms = find_available_rooms(start_date, end_date)
      
      if available_rooms.empty?
        raise StandardError.new("No available rooms.")
      end
      
      room = available_rooms.first
      reservation = HotelSystem::Reservation.new(room: room, start_date: start_date, end_date: end_date)
      
      add_reservation(reservation)
      room.reservations.push(reservation)
      
      reservation
    end 
    
    def add_reservation(reservation)
      reservations.push(reservation)
    end 
    
    def find_reservations(date)
      reservations.select do |reservation|
        reservation.date_range.include?(date)
      end
    end
    
    def find_available_rooms(start_date, end_date)
      range = (start_date..end_date-1)
      available_rooms = []
      
      rooms.each do |room|    
        overlaps = false
        room.reservations.each do |reservation|
          if HotelSystem::Reservation.check_for_overlap(reservation.date_range, range)
            overlaps = true
            break
          end
        end
        if !overlaps
          available_rooms << room
        end
      end
      available_rooms
    end
    
  end 
end