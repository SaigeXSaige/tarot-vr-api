class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else 
      render json: {error: 'invalid inputs'}
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else 
      render json: {error: 'Invalid inputs'}
    end
  end

  def destroy
    @user.destroy
  end

  private 

  def user_params
    params.permit(:username, :password, :password_confirmation, :first_name, :last_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
