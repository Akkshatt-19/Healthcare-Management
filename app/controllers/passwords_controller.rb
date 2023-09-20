class PasswordsController < ApplicationController
    before_action :check_mail, only: [:forgot]
    before_action :check_idp, only: [:reset]
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
        verify_user = User.find_by(id: params[:id])
        if user.email == verify_user.email && user.present? && user.password_token_valid?
            if user.reset_password!(params[:password])
                UserMailer.reset_password(user).deliver_now 
                render json: {status: 'ok'}, status: :ok
            else
                render json: {error: user.errors.full_messages}, status: :unprocessable_entity
            end
        else
            render json: {error: "Unauthorized attempt or OTP expired,Try generating a new link."}, status: :not_found
        end
    end

    private
    def check_mail
        if params[:email].blank?
            return render json: {error: "Email not present"}
        end
    end

    def check_idp
        if (params[:password].blank? || params[:id].blank? || params[:token].blank? ) 
            return render json: {error: "Fields can't be blank"}
        end
    end

end
