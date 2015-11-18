class ErrorsController < ApplicationController
  # 400
  def not_found
    render status: :not_found
  end

  # 422
  def unacceptable
    render status: :unprocessable_entity
  end

  # 500
  def internal_server_error
    render status: :internal_server_error
  end

  # 401
  def security_transgression_error
    render status: :unauthorized
  end
end
