class StaticPagesController < ApplicationController
  def home
    @short = Short.new
    @short2 = Short.last
    @advertisement = Advertisement.new
  end
  
  def manageadvertisements
    if current_user
      @advertisements2 = current_user.advertisements.search(params[:term]).paginate(page: params[:page])
    end
  end
  
end
