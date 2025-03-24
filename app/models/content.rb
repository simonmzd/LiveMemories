class Content < ApplicationRecord
  belongs_to :concert
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  # validates :image, presence: true
  has_one_attached :image
  has_one_attached :video
end
