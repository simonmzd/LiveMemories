class ConcertsController < ApplicationController
  before_action :set_concert, only: [:show]

  def index
    @concerts = Concert.all
  end

  def show
    @contents = @concert.contents
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)

    if @concert.save
      redirect_to concert_path(@concert)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end

  def concert_params
    params.require(:concert).permit(:title, :date, :location, :description)
  end
end
