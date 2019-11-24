class Contractor < ApplicationRecord
    has_many :job_category_contractor
    has_many :job_categories, through: :job_category_contractor
    has_one :contractor_image
    has_many :ratings
end
