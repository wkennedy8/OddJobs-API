class CreateCityZipCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :city_zip_codes do |t|
      t.references :city, null: false, foreign_key: true
      t.references :zip_code, null: false, foreign_key: true

      t.timestamps
    end
  end
end
