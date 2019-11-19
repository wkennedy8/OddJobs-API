class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.string :status
      t.references :contractor, null: false, foreign_key: true
      t.references :user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
