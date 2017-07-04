class AdvertisementsController < ApplicationController
    
    def index
        @advertisements = Advertisement.search(params[:term]).paginate(page: params[:page])
    end
    
    def show
    end
    
    def new
        @advertisement = Advertisement.new
    end
    
    def edit
        @advertisement = Advertisement.find(params[:id])
    end
    
    def create
        @advertisement = current_user.advertisements.build(advertisement_params)
        respond_to do |format|
          if @advertisement.save
            if current_user.admin?
              format.html { redirect_to advertisements_path, notice: 'Advertisement was successfully created.' }
            else
                format.html { redirect_to root_path, notice: 'Advertisement was successfully created.' }
            end
            format.json { render :new, status: :created, location: @advertisement }
          else
            format.html { render :new }
            format.json { render json: @advertisement.errors, status: :unprocessable_entity }
          end
        end
    end

    def update
        @advertisement = Advertisement.find(params[:id])
        respond_to do |format|
          if @advertisement.update(advertisement_params)
            format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
            format.json { render :show, status: :ok, location: @short }
          else
            format.html { render :edit }
            format.json { render json: @advertisement.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def destroy
        @advertisement = Advertisement.find(params[:id])
        @advertisement.destroy
        respond_to do |format|
            if current_user.admin?
              format.html { redirect_to advertisements_path, notice: 'Advertisement was successfully destroyed.' }
            else
              format.html { redirect_to root_path, notice: 'Advertisement was successfully destroyed.' }
            end
            format.json { head :no_content }
        end
    end

    
    private
        
        def advertisement_params
           params.require(:advertisement).permit(:title, :picture, :term)
        end
    
end
