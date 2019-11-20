class ZipCode < ApplicationRecord
    has_many :city_zip_codes
    has_many :zip_codes, through: :city_zip_codes
end
