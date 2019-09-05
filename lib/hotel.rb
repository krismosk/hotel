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
        room = HotelSystem::Room.new(room_number, cost)
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
      
      room = rooms.sample 
      
      reservation = HotelSystem::Reservation.new(reservation_id: reservation_id, room: room, start_date: start_date, end_date: end_date)
      
      add_reservation(reservation)
      room.reservations.push(reservation)
      
      
      # before making a reservation, take the requested start_date & end_date
      # and loop through all hotel.rooms, if a room's start_date 
      
      # reservation(start_date, end_date)
      # add the reservation to the room's list of reservations when the reservation is finalized
      
      # call find_available_rooms here to assign a room
      # find_available_rooms will return a list of available rooms
      # pick the first room from that list and assign it to the reservation 
      
      
      
      return reservation
      
      
      
      
    end 
    
    def add_reservation(reservation)
      reservations.push(reservation)
    end
    # # TO-DO: Make Test
    # # calculate the calendar days in between the start and end date 
    # def calculate_calendar_days_in_reservation 
    #   date_range = (reservation.calculate_stay_duration) - 1
    
    #   date_range.times do |i|
    #     next_day = start_date + i
    #     # TO DO: Add each "next_day" to a Room's list of reserved dates
    #     p next_day
    #   end
    
    # end
    
    
    
    
    # def find_reservation(date)
    #   # Wave 1
    # end 
    
    # def find_available_rooms(start_date, end_date)
    #   rooms.each do |room|
    #     p room
    #   end
    
    
    
    
    #   # hotel.rooms do |room|
    #   #   if room.reservation_dates does not include all dates in the date range
    #   #   assign that room to the reservation
    #   #   add that new reservation to the room.date_reserved
    
    
    
    #   # Give me a room that doesn't have this date reserved 
    #   # return a list of available rooms
    #   # choose the first room from the list 
    # end
    
  end 
end

