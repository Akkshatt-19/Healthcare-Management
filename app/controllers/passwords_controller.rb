class PasswordsController < ApplicationController
    before_action :check_mail, only: [:forgot]
    before_action :check_password, only: [:reset]
    skip_before_action :authenticate_user

    def forgot
        user = User.find_by(email: params[:email])
        if user.present?
            user.generate_password_token!
            UserMailer.forgot_password(user).deliver_now 
            render json: {status: 'ok'}, status: :ok
        else
            render json: {error: "Email address not found. Please check and try again."}, status: :not_found
        end
    end
    
    def reset
        token = params[:token].to_s
        user = User.find_by(reset_password_token: token)
        if user.present? && user.password_token_valid?
            if user.reset_password!(params[:password])
                UserMailer.reset_password(user).deliver_now 
                render json: {status: 'ok'}, status: :ok
            else
                render json: {error: user.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Link not valid or expired. Try generating a new link."}, status: :not_found
        end
    end

    private
    def check_mail
        if params[:email].blank?
            return render json: {error: "Email not present"}
        end
    end

    def check_password
        if params[:password_digest].blank?
            return render json: {error: "Password can't be empty"}
        end
    end

end