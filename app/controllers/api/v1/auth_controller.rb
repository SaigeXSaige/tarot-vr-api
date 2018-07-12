class Api::V1::AuthController < ApplicationController

    def create
      user = User.find_by(username: params[:username])
      
      if user && user.authenticate(params[:password])
        token = encoded_token(user)
        render json: {username: user.username, id: user.id, first_name: user.first_name, last_name: user.last_name, email: user.email, readings: user.readings, jwt: token}, status: 200
      else
        render json: {error: 'Username or Password Invalid'}, status: 401
      end
    end
  
    def show
      if logged_in
        render json: {username: current_user.username, id: current_user.id, first_name: current_user.first_name, last_name: current_user.last_name, email: current_user.email, readings: current_user.readings }, status: 200
      else
        render json: {error: 'Token Invalid'}, status: 401
      end
    end
  
  end