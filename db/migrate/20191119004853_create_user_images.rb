class CreateUserImages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_images do |t|
      t.string :url
      t.references :user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
