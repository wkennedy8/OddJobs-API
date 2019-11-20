class CreateJobCategoryContractors < ActiveRecord::Migration[6.0]
  def change
    create_table :job_category_contractors do |t|
      t.references :job_category, null: false, foreign_key: true
      t.references :contractor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
