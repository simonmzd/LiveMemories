class ParticipationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @concert = Concert.find(params[:concert_id])
    @participation = Participation.new(concert: @concert, user: current_user)
    if @participation.save
      redirect_to concert_path(@concert), notice: "Tu participes maintenant à ce concert !"
    else
      redirect_to concert_path(@concert), alert: "Erreur, impossible de participer."
    end
  end

  def destroy
    @concert = Concert.find(params[:concert_id])
    @participation = Participation.find_by(concert: @concert, user: current_user)
    if @participation&.destroy
      redirect_to @concert, notice: "Tu ne participes plus à ce concert."
    else
      redirect_to @concert, alert: "Erreur, impossible de supprimer la participation."
    end
  end
end
