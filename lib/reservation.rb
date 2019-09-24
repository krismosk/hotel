require_relative 'hotel'
module HotelSystem
  class Reservation
    attr_reader :room, :start_date, :end_date, :date_range
    
    def initialize(room:, start_date:, end_date:)
      if end_date < start_date
        raise ArgumentError.new("Error, the end date you entered #{end_date}, occurs before reservation start date, #{start_date}")
      elsif end_date == start_date
        raise ArgumentError.new("Error, reservation has a one night stay minimum.")
      end
      @room = room
      @start_date = start_date
      @end_date = end_date
      @date_range = (start_date..end_date)
    end
    
    def calculate_total_cost
      calculate_stay_duration * room.cost
    end
    
    def calculate_stay_duration
      end_date.mjd - start_date.mjd
    end
    
    def self.validate_dates(start_date, end_date)
      if end_date < start_date
        raise ArgumentError.new("Error, the end date you entered #{end_date}, occurs before reservation start date, #{start_date}")
      elsif end_date == start_date
        raise ArgumentError.new("Error, reservation has a one night stay minimum.")
      end
    end
    
    def self.check_for_overlap(first_date_range, second_date_range)
      if first_date_range.end <= second_date_range.begin || first_date_range.begin >= second_date_range.end
        return false 
      end
      return true
    end
    
  end
end