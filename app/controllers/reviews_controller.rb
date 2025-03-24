class ReviewsController < ApplicationController
  before_action :set_concert_and_content

  def create
    @review = @content.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to concert_content_path(@concert, @content), notice: "Commentaire ajouté avec succès !"
    else
      redirect_to concert_content_path(@concert, @content), alert: "Erreur lors de l’ajout du commentaire."
    end
  end

  private

  def set_concert_and_content
    @concert = Concert.find(params[:concert_id])
    @content = @concert.contents.find(params[:content_id])
  end

  def review_params
    params.require(:review).permit(:comment) 
  end
end
