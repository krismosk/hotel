require_relative 'hotel'
module HotelSystem
  class Reservation
    attr_reader :reservation_id, :room, :start_date, :end_date
    
    def initialize(reservation_id:, start_date:, end_date:)
      @reservation_id = reservation_id
      @room = room
      @start_date = start_date
      @end_date = end_date
    end
    
    def calculate_total_cost
      # use trip duration and multiply by $200
    end
    
    def duration_of_stay
      # subtract end_date from start_date 
    end 
    
  end
end