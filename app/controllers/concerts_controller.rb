class ConcertsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_concert, only: %i[show edit update destroy]

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
    @concert.user = current_user
    if @concert.save
      redirect_to concert_path(@concert)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @concert.update(concert_params)
      redirect_to concert_path(@concert)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @concert.destroy
    redirect_to concerts_path
  end

  private

  def set_concert
    @concert = Concert.find(params[:id])
  end

  def concert_params
    params.require(:concert).permit(:title, :date, :localisation, :description, :genre, :public, :venue, :image, :user_id)
  end
end
