class DreamsController < ApplicationController

  def index
    
    parse_date if params[:from] && params[:to]

    @dreams = Dream.between(@date_from, @date_to).search(params[:keyword]).lucid?(params[:lucid])
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
      @dreams = Dream.order("created_at DESC")
      render 'index', locals: {form_hidden: false}
    end
  end

  private
    def dream_params
      params.require(:dream).permit(:name, :description, :date, :lucid, dreamsign_ids: [] )
    end

    def parse_date
      from = params[:from]
      to = params[:to]

      if (from["date(1i)"].present? && from["date(2i)"].present? && from["date(3i)"].present? && 
          to["date(1i)"].present? && to["date(2i)"].present? && to["date(3i)"].present?)
        @date_from = Date.new from["date(1i)"].to_i, from["date(2i)"].to_i, from["date(3i)"].to_i
        @date_to = Date.new to["date(1i)"].to_i, to["date(2i)"].to_i, to["date(3i)"].to_i
      end
    end
    
end
