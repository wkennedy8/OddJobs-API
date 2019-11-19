class CityZipCode < ApplicationRecord
  belongs_to :city
  belongs_to :zip_code
end
