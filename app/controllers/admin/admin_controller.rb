module Admin
  class AdminController < ::ApplicationController
    before_action :authenticate_admin
  
    private
  
    def authenticate_admin
      render json: { error: 'Not Authorized' }, status: 401 unless current_user.admin?
    end
  end
end
