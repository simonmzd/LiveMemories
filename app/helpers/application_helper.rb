module ApplicationHelper
  MOIS_FR = {
    "Jan" => "Janv.", "Feb" => "Févr.", "Mar" => "Mars", "Apr" => "Avr.", "May" => "Mai", "Jun" => "Juin",
    "Jul" => "Juil.", "Aug" => "Août", "Sep" => "Sept.", "Oct" => "Oct.", "Nov" => "Nov.", "Dec" => "Déc."
  }.freeze

  JOURS_FR = {
    "Mon" => "Lun.", "Tue" => "Mar.", "Wed" => "Mer.", "Thu" => "Jeu.", "Fri" => "Ven.", "Sat" => "Sam.", "Sun" => "Dim."
  }.freeze

  def mois_en_francais(date)
    MOIS_FR[date.strftime("%b")].upcase
  end

  def jour_en_francais(date)
    JOURS_FR[date.strftime("%a")].upcase
  end
end
