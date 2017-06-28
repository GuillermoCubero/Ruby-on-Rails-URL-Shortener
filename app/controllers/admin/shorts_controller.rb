class Admin::ShortsController < Admin::ApplicationController
    
  # GET /shorts
  # GET /shorts.json
  def index
    @shorts = Short.paginate(page: params[:page])
  end
    
    
  # GET /shorts/1/edit
  def edit
    @short = Short.find(params[:id])
  end
  
  # PATCH/PUT /shorts/1
  # PATCH/PUT /shorts/1.json
  def update
    @short = Short.find(params[:id])
    respond_to do |format|
      if @short.update(short_params)
        format.html { redirect_to admin_shorts_path, notice: 'Short was successfully updated.' }
        format.json { render :show, status: :ok, location: @short }
      else
        format.html { render :edit }
        format.json { render json: @short.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shorts/1
  # DELETE /shorts/1.json
  def destroy
    @short = Short.find(params[:id])
    @short.destroy
    respond_to do |format|
      format.html { redirect_to admin_shorts_path, notice: 'Short was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def short_params
      params.require(:short).permit(:url)
    end
    
end
