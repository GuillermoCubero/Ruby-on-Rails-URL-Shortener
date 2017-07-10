class Admin::ShortsController < Admin::ApplicationController
    
  # GET /shorts
  # GET /shorts.json
  def index
    @shorts = Short.search(params[:term]).paginate(page: params[:page]).order("url ASC")
  end
  
  def show
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
      params.require(:short).permit(:url, :term)
    end
    
end
