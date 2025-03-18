class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show]

  def index
    @concerts = Concert.all
  end

  def show; end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)
    @concert.user = current_user
    @concert.save
    redirect_to concert_path(@concert)
  end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end

  def concert_params
    params.require(:concert).permit(:title, :date, :localisation, :description, :genre, :public, :venue, :image, :user_id)
  end
end
