class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]

  def show
    @user = User.find(params[:id])
    parse_date if params[:from] && params[:to]

    @dreams = Dream.where(user_id: current_user.id).between(@date_from, @date_to).search(params[:keyword]).lucid?(params[:lucid])
    @dream = current_user.dreams.build
    @form_hidden = true
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Account succesfully created!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
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
