class AddReferencesToReview < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :content, null: false, foreign_key: true
  end
end
