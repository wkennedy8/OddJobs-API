class UserProfile < ApplicationRecord
  belongs_to :address
  has_many :credit_cards
  has_many :user_images
  has_many :ratings
  has_many :job_postings
  has_many :contracts
end
