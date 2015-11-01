class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  class SecurityTransgression < StandardError
  end

  rescue_from SecurityTransgression, with: :not_permitted

  private
    def not_permitted
      flash[:notice] = "You don't have permission to perform the action."
      redirect_to security_transgression_error_path
    end

end
