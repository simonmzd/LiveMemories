class User < ApplicationRecord
  has_many :concerts, dependent: :destroy # Concerts créés par l'utilisateur
  has_many :contents, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :participations, dependent: :destroy # Participations aux concerts
  has_many :attended_concerts, through: :participations, source: :concert # Concerts auxquels l'utilisateur participe
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def voted?(content, value)
    vote = content.votes.find_by(user: self)
    vote && vote.value == value
  end
end
