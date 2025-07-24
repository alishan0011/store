class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  include Rails.application.routes.url_helpers
  before_action :authenticate_user!
  before_action :check_user_approval
  


  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :father_name, :cell_no, :city, :country, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :father_name, :cell_no, :city, :country, :image])
  end

  private

  def check_user_approval
    if user_signed_in? && !current_user.approved?
      sign_out current_user
      flash[:alert] = "Your account is pending for approval by an admin."
      redirect_to new_user_session_path
    end
  end
  
end
