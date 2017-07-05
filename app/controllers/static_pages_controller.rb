class StaticPagesController < ApplicationController
  
  def home
    @short = Short.new
    @short2 = Short.last
    @advertisement = Advertisement.new
  end
  
  def redirect
    @advertisement = Advertisement.find(Random.rand(1..Advertisement.last.id))
  end
  
end