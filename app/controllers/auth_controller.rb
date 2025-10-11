class AuthController < ApplicationController
    SECRET_KEY = Rails.application.secret_key_base
  
    # POST /auth/register
    def register
      user = User.new(user_params)
      if user.save
        token = JWT.encode({ user_id: user.id, exp: 24.hours.from_now.to_i }, SECRET_KEY)
        render json: { token: token, user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # POST /auth/login
    def login
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        token = JWT.encode({ user_id: user.id, exp: 24.hours.from_now.to_i }, SECRET_KEY)
        render json: { token: token, user: user }, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
  end
  
