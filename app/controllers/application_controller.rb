class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_params, if: :devise_controller?

  def configure_params
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:username, :email, :password, :current_password)}
  end
end
