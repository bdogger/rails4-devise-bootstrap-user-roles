class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  before_filter :configure_user_update_parameters, if: :devise_controller?
  force_ssl if Rails.env.production?

  def configure_user_update_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation, :current_password) }
  end

  protected

  def self.require_role(role)
    before_filter lambda {
      unless user_signed_in? && current_user.has_role?(role)
        redirect_to root_url, alert: 'Unauthorized to access the requested resource'
      end
    }
  end

end
