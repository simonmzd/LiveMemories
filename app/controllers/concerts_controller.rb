class ConcertsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_concert, only: %i[show edit update destroy]

  def index
    @concerts = Concert.all

    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @concerts = @concerts.where(
        "LOWER(title) LIKE ? OR LOWER(description) LIKE ? OR LOWER(localisation) LIKE ? OR LOWER(genre) LIKE ? OR LOWER(venue) LIKE ?",
        search_term, search_term, search_term, search_term, search_term
      )
    end

    if params[:location].present? && params[:location] != "Tous"
      location_term = "%#{params[:location].downcase.strip}%"
      @concerts = @concerts.where("LOWER(localisation) LIKE ?", location_term)
    end

    if params[:style].present? && params[:style] != "Tous"
      @concerts = @concerts.where("LOWER(genre) LIKE ?", "%#{params[:style].downcase}%")
    end

    if params[:date_range].present? && params[:date_range] != "Tous"
      case params[:date_range]
      when "Cette semaine"
        @concerts = @concerts.where(date: Date.today..Date.today + 7.days)
      when "Ce mois"
        @concerts = @concerts.where(date: Date.today..Date.today.end_of_month)
      when "Prochain mois"
        next_month_start = Date.today.next_month.beginning_of_month
        next_month_end = Date.today.next_month.end_of_month
        @concerts = @concerts.where(date: next_month_start..next_month_end)
      when "À venir"
        @concerts = @concerts.where("date >= ?", Date.today)
      end
    end

    @concerts = @concerts.order(date: :asc)

    puts "Concerts: #{@concerts.count}"
  end

  def show
    @contents = @concert.contents.includes(:votes).sort_by { |content| -content.upvotes_count }
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
    params.require(:concert).permit(:title, :date, :localisation, :description, :genre, :public, :venue, :image, :user_id,)
  end
end
