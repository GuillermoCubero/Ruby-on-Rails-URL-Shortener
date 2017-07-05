class Admin::AdminAdvertisementsController < Admin::ApplicationController
    
    def index
        @advertisements = Advertisement.search(params[:term]).paginate(page: params[:page])
    end
    
    def show
    end
    
    def destroy
        @advertisement = Advertisement.find(params[:id])
        @advertisement.destroy
        respond_to do |format|
            format.html { redirect_to admin_admin_advertisements_path, notice: 'Advertisement was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
end
