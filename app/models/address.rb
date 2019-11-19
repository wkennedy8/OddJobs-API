class Address < ApplicationRecord
  belongs_to :city_zip_code
  belongs_to :state
  has_one :user_profiles
end
