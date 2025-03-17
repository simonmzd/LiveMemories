class User < ApplicationRecord
  has_many :concerts
  has_many :contents
  has_many :reviews
  has_many :participations, dependent: :destroy
  # has_many :attended_concerts, through: :participations, source: :concerts, class: "Concert"
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
