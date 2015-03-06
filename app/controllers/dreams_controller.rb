class DreamsController < ApplicationController
  def index
    @dreams = Dream.all
  end

  def show
    @dream = Dream.find(params[:id])
  end

  def create
    @dream = Dream.new(dream_params)

    if @dream.save
      flash[:success] = 'Dream was successfully added'
      redirect_to @dream
    else
      render 'index'
    end
  end

  private
    def dream_params
      params.require(:dream).permit(:name, :description, :date)
    end
end
