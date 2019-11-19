class JobCategory < ApplicationRecord
    has_many :job_category_contractor
    has_many :contractors, through: :job_category_contractor
    has_many :job_postings
end
