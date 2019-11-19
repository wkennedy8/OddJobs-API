class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :street1
      t.string :street2
      t.references :city_zip_code, null: false, foreign_key: true
      t.references :state, null: false, foreign_key: true

      t.timestamps
    end
  end
end
