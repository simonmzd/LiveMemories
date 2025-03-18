class Concert < ApplicationRecord
  belongs_to :user
  has_many :contents, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :date, presence: true
  validates :localisation, presence: true
  validates :public, presence: true
  validates :venue, presence: true
  has_one_attached :photo
end
