class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :company) }
  end
  
  private
  
  def correct_user
    @user = User.find(Advertisement.find(params[:id]).user_id)
    unless current_user == @user || current_user.admin?
      respond_to do |format|
        format.html { redirect_to root_path, alert: 'Need to be administrator for this.' }
      end
    end  
  end
  
end
