class Content < ApplicationRecord
  belongs_to :concert
  belongs_to :user
  has_many :reviews, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
end
