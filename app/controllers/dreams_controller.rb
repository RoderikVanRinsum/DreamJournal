class DreamsController < ApplicationController
  def index
    @dreams = Dream.order("created_at DESC")
    @dream = Dream.new
    @form_hidden = true
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
      @dreams = Dream.all
      render 'index', locals: {form_hidden: false}
    end
  end

  private
    def dream_params
      params.require(:dream).permit(:name, :description, :date, :lucid)
    end
end
