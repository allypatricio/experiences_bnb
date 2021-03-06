class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @no_container = true
    @experiences = Experience.all

    durations = []
    @experiences.each do |exp|
      durations << exp.duration
    end

    @max_duration = durations.max.to_i + 1

    prices = []
    @experiences.each do |exp|
      prices << exp.price
    end

    @max_price = prices.max.to_i + 10

    if params[:search].present?
      @experiences = @experiences = Experience.perform_search(params[:search])
      @experiences = @experiences.category(params[:category].downcase.capitalize).perform_search(params[:search]) if params[:category].present? && !params[:category].empty?
      @experiences = @experiences.duration(params[:duration]).perform_search(params[:search]) if params[:duration].present?
      @experiences = @experiences.price(params[:price]).perform_search(params[:search]) if params[:price].present?
    else
      @experiences = @experiences.category(params[:category].downcase.capitalize) if params[:category].present? && !params[:category].empty?
      @experiences = @experiences.duration(params[:duration]) if params[:duration].present?
      @experiences = @experiences.price(params[:price]) if params[:price].present?
    end

    respond_to do |format|
      format.html
      format.js
    end
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
     @no_container = true

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
