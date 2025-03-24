class ParticipationsController < ApplicationController
  before_action :authenticate_user! # Vérifie que l'utilisateur est connecté

  def create
    @concert = Concert.find(params[:concert_id]) # Trouve le concert
    @participation = Participation.new(concert: @concert, user: current_user) # Crée une participation
    if @participation.save
      redirect_to @concert, notice: "Tu participes maintenant à ce concert !"
    else
      redirect_to @concert, alert: "Erreur, impossible de participer."
    end
  end

  def destroy
    @concert = Concert.find(params[:concert_id]) # Trouve le concert
    @participation = Participation.find_by(concert: @concert, user: current_user) # Trouve la participation
    if @participation&.destroy
      redirect_to @concert, notice: "Tu ne participes plus à ce concert."
    else
      redirect_to @concert, alert: "Erreur, impossible de supprimer la participation."
    end
  end
end
