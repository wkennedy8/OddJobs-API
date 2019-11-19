class CreateContractorImages < ActiveRecord::Migration[6.0]
  def change
    create_table :contractor_images do |t|
      t.string :url
      t.references :contractor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
