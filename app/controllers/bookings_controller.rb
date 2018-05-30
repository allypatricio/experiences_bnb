class BookingsController < ApplicationController
  before_action :set_experience, only: :create

  def index
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
    @booking = Booking.new(user_id: current_user.id, experience_id: @experience.id)
    # @host = User.find(@experience.user_id)
    # @guest = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.experience = @experience
    @booking.user = current_user
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @experience, notice: 'Your booking is confirmed!' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def booking_params
    params.require(:booking).permit(:date_time, :message)
  end
end
