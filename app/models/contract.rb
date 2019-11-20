class Contract < ApplicationRecord
  belongs_to :contractor
  belongs_to :user_profile
  has_one :job_posting
end
