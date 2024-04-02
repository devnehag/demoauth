class JobsController < ApplicationController
    before_action :authenticate_request
    def index
      render json: @current_user.jobs
    end  
    private
    def authenticate_request
      token = request.headers['Authorization'].split(' ').last
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, { algorithm: 'HS256' })
      @current_user = User.find(decoded_token[0]['id'])
    rescue
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
