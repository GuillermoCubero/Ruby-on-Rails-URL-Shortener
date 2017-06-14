class StaticPagesController < ApplicationController
  def home
    @short = Short.new
    @short2 = Short.last
  end
end
