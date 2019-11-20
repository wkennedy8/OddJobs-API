class CreatePhones < ActiveRecord::Migration[6.0]
  def change
    create_table :phones do |t|
      t.integer :kind
      t.string :value
      t.references :user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
