class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name address role phone_number password email])
  end

  def after_sign_out_path_for(_resource)
    session[:previous_url] || root_path
  end

  def after_sign_in_path_for(_resource)
    session[:previous_url] || user_categories_path(current_user.id)
  end
end
