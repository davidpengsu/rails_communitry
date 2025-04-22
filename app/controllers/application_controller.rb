class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :update_last_login, if: -> { user_signed_in? && current_user.present? }
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname])
  end
  
  def update_last_login
    current_user.update_last_login if current_user.last_login_at.nil? || Time.current - current_user.last_login_at > 5.minutes
  end
end
