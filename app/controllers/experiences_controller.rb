class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index 
    @experiences = Experience.all
    @experiences = @experiences = Experience.perform_search(params[:search]) if params[:search].present?
    @experiences = @experiences.category(params[:category].downcase.capitalize) if params[:category].present?
    @experiences = @experiences.duration(params[:duration].downcase.capitalize) if params[:duration].present?
    @experiences = @experiences.price(params[:price].downcase.capitalize) if params[:price].present?

    @no_container = true
  end


  def show
    @no_container = true
    @markers = [{
      lat: @experience.latitude,
      lng: @experience.longitude
    }]
    @booking = Booking.new(experience_id: params[:id])
  end

  def new
     @experience = Experience.new()
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: 'Experience was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :category, :description, :duration, :address, :price, :photo, :photo_cache)
  end

end
