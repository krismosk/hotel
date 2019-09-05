require_relative 'hotel'
module HotelSystem
  class Reservation
    attr_reader :reservation_id, :room, :start_date, :end_date
    
    def initialize(reservation_id:, room:, start_date:, end_date:)
      @reservation_id = reservation_id
      @room = room
      @start_date = start_date
      @end_date = end_date
      # @total_cost = total_cost
    end
    
    def calculate_total_cost
      calculate_stay_duration * room.cost
    end
    
    def calculate_stay_duration
      end_date.mjd - start_date.mjd
      # look into date.overlap 
    end 
    
  end
end