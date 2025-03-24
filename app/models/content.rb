class Content < ApplicationRecord
  belongs_to :concert
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  validates :title, presence: true
  has_one_attached :video
  has_one_attached :image

  def upvotes_count
    votes.where(value: 1).count
  end

  def downvotes_count
    votes.where(value: -1).count
  end

  def score
    upvotes_count - downvotes_count
  end
end
