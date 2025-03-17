class CreateConcerts < ActiveRecord::Migration[7.1]
  def change
    create_table :concerts do |t|
      t.string :title
      t.text :description
      t.string :genre
      t.date :date
      t.string :localisation
      t.integer :public
      t.string :venue
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
