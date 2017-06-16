class UserController < ApplicationController
    def index
        @users = User.paginate(page: params[:page])
    end
    
    def show
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        respond_to do |format|
            format.html { redirect_to user_index_path, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
    def update
        @user = User.find(params[:id])
        if @user.admin?
            @user.update_attribute(:admin, false)
            redirect_to @user, notice: 'Admin privileges has been revoked.'
        else
            @user.update_attribute(:admin, true)
            redirect_to @user, notice: 'Admin privileges has been granted.'
        end
    end
    
    private
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:admin)
    end
end