class ContentsController < ApplicationController
  before_action :set_concert, only: %i[index show new create destroy]
  before_action :set_content, only: %i[destroy]

  def index
    @contents = Content.all
  end

  def show
    @content = Content.new
  end

  def new
    @content = Content.new
  end

  def create
    @content = @concert.contents.new(content_params)
    @content.user = current_user
    @content.save
    redirect_to concerts_path(@concert)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_concert
    @concert = Concert.find(params[:concert_id])
  end

  def set_content
    @content = @concert.content.find(params[:id])
  end

  def content_params
    params.require(:content).permit(:title, :description, :concert_id, :user_id)
  end
end
