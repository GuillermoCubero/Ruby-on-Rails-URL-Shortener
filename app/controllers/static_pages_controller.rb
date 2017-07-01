class StaticPagesController < ApplicationController
  def home
    @short = Short.new
    @short2 = Short.last
  end
  
  def manageadvertisements
    @advertisement = Advertisement.new
    @advertisements2 = current_user.advertisements.paginate(page: params[:page])
  end
  
end
