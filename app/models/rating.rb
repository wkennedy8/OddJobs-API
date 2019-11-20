class Rating < ApplicationRecord
  belongs_to :user_profile
  belongs_to :contractor
end
