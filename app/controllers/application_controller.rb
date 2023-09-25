class ApplicationController < ActionController::Base
  include JwtToken
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_user
  
  before_action do
    ActiveStorage::Current.url_options = request.base_url
  end
  
  private 
  def authenticate_user
    header = request.headers['Authorization']
    header = header.split(' ').last if header  
    begin
      decoded = jwt_decode(header)
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { error: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e  
      render json: { error: e.message }, status: :unauthorized 
    end
  end
  rescue_from ActiveRecord::RecordNotFound, with: :handle_exception
  # rescue_from ActiveRecord::ArgumentError,with: :handle_argument_error
  def handle_exception
    render json: { error: 'ID not found' }
  end
  # def handle_argument_error
  #   render json: { error: 'Please fill fields correctly' }
  # end
  
  def check_permission
    unless (@current_user.admin? || @current_user.sub_admin?)
      render json: {message: "You're not authorized for this action"}
    end
  end
  
  def check_patient
    unless @current_user.patient?
      render json: { errors: "You are not authorized to perform this action" }, status: :unauthorized
    end
  end
  
  def check_sub_admin
    unless (@current_user.sub_admin?)
      render json: {message: "You're not authorized for this action"}
    end
  end
  
  def check_admin
    unless (@current_user.admin?)
      render json: {message: "You're not authorized for this action"}
    end
  end
end
