class StaticPagesController < ApplicationController
  def home
    @short = Short.new
    @short2 = Short.last
  end
  
  def redirect
    @advertisement = Advertisement.order("RANDOM()").first
    @redirection = Short.find(params[:id].to_i(36)).url
    @advertiser = User.find(@advertisement.user_id).company
  end
  
  def welcome
    if current_user.is_female == true
      @gender = "Ms."
    else
      @gender = "Mr."
    end
    @name = current_user.name
    
    if current_user.admin?
      @role = "administrator"
    else
      @role = "advertiser"
    end
  end
  
end