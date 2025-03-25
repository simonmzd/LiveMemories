class User < ApplicationRecord
  has_many :concerts, dependent: :destroy
  has_many :contents, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :attended_concerts, through: :participations, source: :concert
  has_one_attached :avatar
  validates :username, presence: true
  validates :avatar, presence: false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def voted?(content, value)
    vote = content.votes.find_by(user: self)
    vote && vote.value == value
  end
end
