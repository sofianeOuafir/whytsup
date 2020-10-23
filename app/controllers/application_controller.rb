class ApplicationController < ActionController::API
  include ::ActionController::Cookies

  before_action :authenticate_request

  private

  def authenticate_request
    render json: { error: 'Not Authorized' }, status: 401 unless current_user
  end

  def current_user
    puts "cookie: #{cookies.signed[:jwt]}" 
    @current_user ||= AuthorizeApiRequest.call(cookies.signed[:jwt]).result
  end
end