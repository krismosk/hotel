require_relative 'test_helper'

describe "Hotel class" do 
  describe "Hotel instantiation" do
    before do
      @hotel = HotelSystem::Hotel.new(20)
    end
    
    it "is an instance of Hotel" do 
      expect(@hotel).must_be_kind_of HotelSystem::Hotel
    end
    
    it "will create the correct number of rooms" do
      @hotel.create_rooms
      expect(@hotel.rooms.length).must_equal 20
    end 
    
    it "will generate a room number for each instance of Room" do
      @hotel.create_rooms
      expect(@hotel.rooms.first.room_number).must_equal 1
    end 
    
  end
  
  describe "Make_Reservation Method" do
    before do
      @hotel = HotelSystem::Hotel.new(20)
      @hotel.create_rooms
      @room = @hotel.rooms.sample
      @start_date = Date.new(2019,03,20)
      @end_date = Date.new(2019,03,25)
      @reservation = @hotel.make_reservation(@start_date, @end_date)
      @hotel.add_reservation(@reservation)
      @room.reservations.push(@reservation)
    end 
    
    it "will create a new Reservation" do
      expect(@hotel.make_reservation(@start_date, @end_date)).must_be_kind_of HotelSystem::Reservation
    end
    
    it "will add the new reservation to the Hotel's list of reservations" do 
      expect(@hotel.reservations).must_include @reservation
    end 
    
    it "will add the new reservation to the Rooms's list of reservations" do 
      expect(@room.reservations).must_include @reservation
    end 
    
    it "raises an error for end_date being earlier than start_date" do
      start_date = Date.new(2019,03,22)
      end_date = Date.new(2019,03,20)
      expect do
        @hotel.make_reservation(start_date, end_date)
      end.must_raise ArgumentError
    end
    
    it "raises an error for start_date and end_date being the same day" do
      start_date = Date.new(2019,03,22)
      end_date = Date.new(2019,03,22)
      expect do
        @hotel.make_reservation(start_date, end_date)
      end.must_raise ArgumentError
    end
    
    # it "will find an available room to assign to the reservation" do
    #   @hotel.rooms.each do |room|
    #     if room.reservations.start_date != @start_date
    #     end
    #   end
    # end
    
    it "will assign a room to the reservation" do
      expect(@reservation.room).wont_be_nil
    end
    
    # it "Find_available_rooms method" do
    
    
    
    #   # it will return a list of room objects that do not have
    #   # the passed in date in it's list of reservations
    
    # end
  end
  
  
  
  
  
end
