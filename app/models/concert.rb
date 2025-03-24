class Concert < ApplicationRecord
  belongs_to :user
  has_many :contents, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations
  validates :title, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :date, presence: true
  validates :localisation, presence: true
  validates :public, presence: true
  validates :venue, presence: true
  has_one_attached :image
  has_one_attached :video
end
