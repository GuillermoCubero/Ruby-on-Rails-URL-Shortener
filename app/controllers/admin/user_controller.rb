class Admin::UserController < Admin::ApplicationController
    
    def index
        @users = User.search(params[:term]).paginate(page: params[:page]).order("last_sign_in_at DESC")
    end
    
    def show
    end
    
    def destroy
        @user = User.find(params[:id])
        if !@user.admin?
            @user.destroy
            respond_to do |format|
                format.html { redirect_to admin_user_index_path, notice: 'User was successfully destroyed.' }
                format.json { head :no_content }
            end
        else
            respond_to do |format|
                format.html { redirect_to admin_user_index_path, alert: 'Cannot destroy an admin.' }
                format.json { head :no_content }
            end
        end

    end
    
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to admin_user_index_path, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @short }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
      end
    end

     private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
    
end
