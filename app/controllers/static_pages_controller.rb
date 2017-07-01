class StaticPagesController < ApplicationController
  def home
    @short = Short.new
    @short2 = Short.last
    @advertisement = Advertisement.new
    if current_user
      @advertisements2 = current_user.advertisements.paginate(page: params[:page])
    end
  end
  
end
