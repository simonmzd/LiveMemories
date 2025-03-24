class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :content
end
