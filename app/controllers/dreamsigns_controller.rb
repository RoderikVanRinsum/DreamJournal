class DreamsignsController < ApplicationController
  def index
    @dreamsigns = Dreamsign.all
  end

  def show
  end
end
