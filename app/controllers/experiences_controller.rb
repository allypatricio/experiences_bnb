class ExperiencesController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
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

end
