class Api::V1::ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :destroy]

  def index
    @readings = Reading.all
    render json: @readings
  end

  def create
    @reading = Reading.create(reading_params)
    @reading_cards = params[:card_ids]

    @reading_cards.each {|cardId| ReadingCard.create({reading_id: @reading.id, card_id: cardId})}


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
