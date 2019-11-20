class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :value
      t.text :review_text
      t.references :user_profile, null: false, foreign_key: true
      t.references :contractor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
