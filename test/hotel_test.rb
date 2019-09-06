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
  
  describe "#list_rooms" do
    it "will display a list of all rooms in Hotel" do
      hotel = HotelSystem::Hotel.new(20)
      expect(hotel.list_rooms).must_be_kind_of Array
    end
  end
  
  describe "#make_reservation" do
    before do
      @hotel = HotelSystem::Hotel.new(20)
      @hotel.create_rooms
      @room = @hotel.rooms.first
      @start_date = Date.new(2019,03,20)
      @end_date = Date.new(2019,03,25)
      @reservation = @hotel.make_reservation(@start_date, @end_date)
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
    
    it "will assign a room to the reservation" do
      expect(@reservation.room).wont_be_nil
    end
  end
  
  describe "#find_available_rooms" do
    describe "when there are no available rooms between start_date and end_date" do
      it "returns and empty array" do
        hotel = HotelSystem::Hotel.new(1)
        hotel.create_rooms
        reservation = hotel.make_reservation(Date.new(2019,3,20),Date.new(2019,3,25))
        
        expect(hotel.find_available_rooms(Date.new(2019,3,22), Date.new(2019,3,26))).must_equal []
      end
    end
    
    describe "when there are available rooms between start_date and end_date" do
      it "returns an array of rooms"
    end
  end

  describe "#find_reservation" do
    before do
      @hotel = HotelSystem::Hotel.new(20)
      @hotel.create_rooms
      
      @reservation1 = @hotel.make_reservation(Date.new(2019,03,20), Date.new(2019,03,25))
      @reservation2 = @hotel.make_reservation(Date.new(2019,03,19), Date.new(2019,03,22))
    end

    it "will take a date and return a list of all reservations booked on that date" do
      query_date = Date.new(2019,03,21)
      
      reservations = @hotel.find_reservations(query_date)
      expect(reservations).must_include @reservation1
      expect(reservations).must_include @reservation2
    end

    it "will return nil if there are no reservations booked on that date" do
      query_date = Date.new(2019,03,18)
      expect(@hotel.find_reservations(query_date)).must_equal []
    end
  end
end