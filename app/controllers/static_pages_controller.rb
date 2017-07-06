class StaticPagesController < ApplicationController
  
  def home
    @short = Short.new
    @short2 = Short.last
    @advertisement = Advertisement.new
  end
  
  def redirect
    @advertisement = Advertisement.order("RANDOM()").first
    @origin = Short.find(params[:rid]).url
  end
  
end