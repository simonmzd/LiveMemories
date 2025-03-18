class ContentsController < ApplicationController
before_action :set_concert
before_action :set_content

  def index
    @concert = Concert.find(params[:concert_id])
    @content = Content.all
  end

  def show
    @concert = Concert.find(params[:concert_id])
    @content = Content.new
  end

  def new
    @concert = Concert.find(params[:concert_id])
    @content = Content.new
  end

  def create
  end

  private

  def set_concert
  end

  def set_content
  end
end
