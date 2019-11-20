class CreateJobImages < ActiveRecord::Migration[6.0]
  def change
    create_table :job_images do |t|
      t.string :url
      t.references :job_posting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
