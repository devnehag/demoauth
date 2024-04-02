class AuthenticationController < ApplicationController
    def login
      user = User.find_by(username: params[:username])
      if user&.authenticate(params[:password])
        render json: { token: user.generate_jwt }, status: :ok
      else
        render json: { error: 'unauthorized' }, status: :unauthorized
      end
    end
  end