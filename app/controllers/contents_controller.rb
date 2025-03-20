class ContentsController < ApplicationController
  before_action :set_concert, only: %i[index show new create edit update destroy]
  before_action :set_content, only: %i[edit update destroy]

  def index
    @contents = @concert.contents
  end

  def show
    @content = Content.new
    @concert = @content.concert
  end

  def new
    @content = Content.new
  end

  def create
    @content = @concert.contents.new(content_params)
    @content.user = current_user
    @content.save
    redirect_to concert_path(@concert)
  end

  def edit; end

  def update
    @content.update(content_params)
    redirect_to dashboard_path
  end

  def destroy
    @content.destroy
    redirect_to dashboard_path
  end

  private

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end

  def set_content
    @content = @concert.contents.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :description, :concert_id, :user_id, :image)
  end
end
