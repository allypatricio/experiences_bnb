class BookingsController < ApplicationController


  def index
    @no_container = true
    @experiences = Experience.all
    bookings = Booking.all
    @bookings_user = []
    bookings.each do |booking|
       if booking.user_id  == current_user.id
        @bookings_user << booking
      end
    end

    @bookings_host = []
    bookings.each do |booking|
      if Experience.find(booking.experience_id).user_id == current_user.id
      @bookings_host << booking
      end
    end

  end
  def new
    @experience = Experience.find(params[:experience_id])
    @host = User.find(@experience.user_id)
    @guest = current_user
    @booking = Booking.new(user_id: current_user.id, experience_id: @experience.id)
  end

  def create
    # show a datepicker modal in which the guest can select a date
    # @booking.date = params[:date]
    # @booking.save
  end

  def destroy
  end
end
