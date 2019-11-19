class JobCategoryContractor < ApplicationRecord
  belongs_to :job_category
  belongs_to :contractor
end
