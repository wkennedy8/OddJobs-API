class JobPosting < ApplicationRecord
  belongs_to :job_category
  belongs_to :contract
  belongs_to :user_profile
  has_many :job_images
end
