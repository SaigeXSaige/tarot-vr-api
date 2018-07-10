class Api::V1::ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :destory]

  def index
    @readings = Reading.all
    render json: @readings
  end

  def create
    @reading = Reading.create(reading_params)
  end

  def show
    render json: @reading
  end

  def destroy
    @reading.destroy
  end

  private

  def reading_params
    params.permit(:user_id, :date)
  end

  def set_reading
    @reading = Reading.find(params[:id])
  end
end