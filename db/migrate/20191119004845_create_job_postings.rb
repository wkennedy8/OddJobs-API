class CreateJobPostings < ActiveRecord::Migration[6.0]
  def change
    create_table :job_postings do |t|
      t.string :title
      t.text :description
      t.references :job_category, null: false, foreign_key: true
      t.references :contract, null: false, foreign_key: true
      t.references :user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
