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
      cost = 200
      room_number = 0
      @amount_of_rooms.times do
        room_number += 1 
        room = HotelSystem::Room.new(room_number: room_number, cost: cost)
        rooms.push(room)
      end
      
    end
    
    def list_rooms
      create_rooms
      rooms
    end
    
    def make_reservation(start_date, end_date)
      if end_date < start_date
        raise ArgumentError.new("Error, the end date you entered #{end_date}, occurs before reservation start date, #{start_date}")
      elsif end_date == start_date
        raise ArgumentError.new("Error, reservation has a one night stay minimum.")
      end
      
      reservation_id = rand(100..500)
      
      available_rooms = find_available_rooms(start_date, end_date)
      
      if available_rooms.empty?
        raise ArgumentError.new("No available rooms.")
      end
      
      room = available_rooms.first
      reservation = HotelSystem::Reservation.new(reservation_id: reservation_id, room: room, start_date: start_date, end_date: end_date)
      
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
          if check_for_overlap(reservation.date_range, range)
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

    def check_for_overlap(first_reservation, second_reservation)
      if first_reservation.end <= second_reservation.begin && \
        first_reservation.begin >= second_reservation.end
        return false 
      end
      return true
    end
  end 
end

