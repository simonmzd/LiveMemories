class Concert < ApplicationRecord
  belongs_to :user # Le créateur du concert
  has_many :contents, dependent: :destroy
  has_many :participations, dependent: :destroy # Relation avec les participations
  has_many :users, through: :participations # Les utilisateurs qui participent
  validates :title, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :date, presence: true
  validates :localisation, presence: true
  validates :public, presence: true
  validates :venue, presence: true
  has_one_attached :image
end
