class ShortsController < ApplicationController
  before_action :set_short, only: [:show]

  def redirect_id
    redirect_to Short.find(params[:id].to_i(36)).url
  end
  

  # GET /shorts/1
  # GET /shorts/1.json
  def show
  end

  # GET /shorts/new
  def new
    @short = Short.new
  end


  # POST /shorts
  # POST /shorts.json
  def create
    @short = Short.new(short_params)
    respond_to do |format|
      if @short.save
        format.html { redirect_to root_path, notice: 'Short was successfully created.' }
        format.json { render :new, status: :created, location: @short }
      else
        format.html { render :new }
        format.json { render json: @short.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_short
      @short = Short.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_params
      params.require(:short).permit(:url)
    end
end