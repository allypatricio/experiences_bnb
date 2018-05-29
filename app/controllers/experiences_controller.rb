class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  def index
    @experiences = Experience.all

  end

  def show
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
  def article_params
  params.require(:experience).permit(:photo)
end

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def experience_params
    params.require(:experience).permit(:title, :category, :description, :duration, :address, :price, :photo)
  end

end
