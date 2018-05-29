class BookingsController < ApplicationController
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
