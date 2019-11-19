# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
IMAGE_PLACEHOLDER = "https://placeholder.apps.selfip.com/image/200x200/"

def random_cvc()
    digits = (0..9).to_a
    3.times.map{digits.sample}.join
end
def random_boolean
    [true, false].sample
end
def random_rating
    return (1..5).to_a.sample
end

def random_status
    ['started', 'in progress', 'completed'].sample
end
user = User.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
p user
city = City.find_or_create_by!(name: "Miami")
zip_code = ZipCode.find_or_create_by!(value: "33111")
city_zip_code = CityZipCode.find_or_create_by!(city: city, zip_code:zip_code)
p city_zip_code.zip_code
p city_zip_code.city
state = State.find_or_create_by!(name: Faker::Address.state_abbr)
address = Address.create!(street1: Faker::Address.street_address, street2: nil, city_zip_code: city_zip_code, state: state)
user_profile = UserProfile.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, ex_email: user.email, address: address)
2.times do
    phone = Phone.create!(kind: (1..3).to_a.sample, value: Faker::PhoneNumber.phone_number, user_profile: user_profile) 
    p phone
end
user_image = UserImage.create!(url: IMAGE_PLACEHOLDER, user_profile: user_profile)
p user_image

3.times do
    cc = CreditCard.create!(card_number: Faker::Business.credit_card_number,
        card_exp_date: Faker::Business.credit_card_expiry_date,
        card_cvc_number: random_cvc,
        user_profile: user_profile
    )
    p cc
end
100.times do 
    contractor = Contractor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, background_check: random_boolean)
    p contractor
    contractor_image = ContractorImage.create!(url: IMAGE_PLACEHOLDER, contractor: contractor)
    rating = Rating.create!(value: random_rating, review_text: Faker::Lorem.paragraph, contractor: contractor, user_profile: user_profile) 
    p contractor_image
    contract = Contract.create!(contractor: contractor, status: random_status, user_profile: user_profile)
    job_category = JobCategory.find_or_create_by!(name: Faker::Lorem.word)
    job_posting = JobPosting.create!(description: Faker::Lorem.paragraph, title: Faker::Lorem.sentence, contract: contract, job_category: job_category, user_profile: user_profile)
    contractor.job_categories << job_category
end
