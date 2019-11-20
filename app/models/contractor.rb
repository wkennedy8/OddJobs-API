class Contractor < ApplicationRecord
    has_many :job_category_contractor
    has_many :job_categories, through: :job_category_contractor
    has_many :contractor_images
    has_many :ratings
end
