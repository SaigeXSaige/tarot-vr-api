class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else 
      render json: {error: @user.errors}
    end
  end

  def show
    render json: @user
  end

  def update
    
    if @user.update(user_params)
      render json: {username: @user.username, id: @user.id, first_name: @user.first_name, last_name: @user.last_name, email: @user.email, readings: @user.readings.map {|reading| {reading_id: reading.id, cards: reading.cards} } }, status: 200
    else 
      render json: {error: @user.errors}, status: 401
    end
  end

  def destroy
    @user.destroy
  end

  private 

  def user_params
    params.permit(:username, :first_name, :last_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
