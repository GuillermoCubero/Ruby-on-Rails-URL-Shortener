class Admin::ApplicationController < ApplicationController
  before_action :authorize_admin!
  
  private
  
    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        respond_to do |format|
          format.html { redirect_to root_path, alert: 'Need to be administrator for this.' }
        end
      end
    end
  
end
