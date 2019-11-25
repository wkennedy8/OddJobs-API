# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
IMAGE_PLACEHOLDER = "https://placeholder.apps.selfip.com/image/200x200/"
SAMPLE_ADDRESSES = [
"2650 NW 5 ave Miami, FL 33127", "9621 Fontainebleau Blvd. Miami, FL 33172", "1865 79 st CSWY North Bay Village, FL 33141", "1855 Purdy Ave Miami Beach, FL 33139", 
"251 NW 25th St, Miami, FL 33127", "9999 NE 2nd Ave, Miami Shores, FL 33138", "1425 NE 163rd St, North Miami Beach, FL 33162", "1255 W 49th St, Hialeah, FL 33012", "15504 Biscayne Blvd, North Miami Beach, FL 33160",
"358 San Lorenzo Ave, Coral Gables, FL 33146", "12705 NW 42nd Ave, Opa-locka, FL 33054", "5050 SW 90th Ave, Cooper City, FL 33328", "3251 S Miami Ave, Miami, FL 33129", 
"5555 Collins Ave, Miami Beach, FL 33140", "9700 Collins Ave, Bal Harbour, FL 33154", "11300 NE 2nd Ave, Miami Shores, FL 33161", "3555 SW 8th St, Miami, FL 33135", "2200 E 4th Ave, Hialeah, FL 33013",
"S 20th Ave, Hollywood, FL 33020", "1005 Joe DiMaggio Dr, Hollywood, FL 33021", "11960 Pines Blvd, Pembroke Pines, FL 33026", "3252 SW 22nd St, Miami, FL 33145", "1099 NE 79th St, Miami, FL 33138", 
"465 Brickell Ave, Miami, FL 33131", "668 NW 5th St, Miami, FL 33128", "4870 Biscayne Blvd, Miami, FL 33137", "1100 NW 95th St, Miami, FL 33150", "4041 Collins Ave, Miami Beach, FL 33140", "1073 95th St, Bay Harbor Islands, FL 33154",
"650 NW 71st St, Miami, FL 33150" 
]

CATEGORIES = ['']
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

def random_category 
    [
        { name: 'Errand Running', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/run_errands_tile.png" },
        { name: 'Pool Cleaning', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/pool_cleaning_tile.png" },
        { name: 'Plumbing', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/plumbing_tile.png" },
        { name: 'Pet Care', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/pet_care_tile.png" }, 
        { name: 'Moving', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/moving_tile.png" },
        { name: 'Mounting', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/mounting_tile.png" },
        { name: 'Lawn Care', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/Lawn_care_tile.png" },
        { name: 'House Painting', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/house_painting_tile.png" },
        { name: 'Home Repairs', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/home_repairs_tile.png" },
        { name: 'Furniture Assembly', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/furniture_assembly_tile.png" },
        { name: 'Electrical', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/Electrical_tile.png" },
        { name: 'House Cleaning', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/cleaning tile.png" },
        { name: 'Carpentry', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/carpentry_tile.png" },
        { name: 'Car Wash', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/car_was_tile.png" },
        { name: 'Babysitting', image_url: "https://leo.nyc3.digitaloceanspaces.com/oddjobs/babysitting_tile.png" },
    ].sample 
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

user_image = UserImage.find_or_create_by!(url: IMAGE_PLACEHOLDER, user_profile: user_profile)

3.times do
    cc = CreditCard.create!(card_number: Faker::Business.credit_card_number,
        card_exp_date: Faker::Business.credit_card_expiry_date,
        card_cvc_number: random_cvc,
        user_profile: user_profile
    )
    p cc
end
30.times do 
    contractor = Contractor.create!(
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name, 
        address: SAMPLE_ADDRESSES.sample,
        background_check: random_boolean
    )
    contractor_image = ContractorImage.create!(
        url: IMAGE_PLACEHOLDER, 
        contractor: contractor
    )
    rating = Rating.create!(
        value: random_rating, 
        review_text: Faker::Lorem.paragraph, 
        contractor: contractor, 
        user_profile: user_profile
    ) 
    contract = Contract.create!(
        contractor: contractor, 
        status: random_status, 
        user_profile: user_profile
    )
    (1..5).to_a.sample.times do
        category = random_category
        job_category = JobCategory.find_or_create_by!(name: category[:name], image_url: category[:image_url])
        contractor.job_categories << job_category
        job_posting = JobPosting.create!(
            description: Faker::Lorem.paragraph, 
            title: Faker::Lorem.sentence, 
            contract: contract, 
            job_category: job_category, 
            user_profile: user_profile
        )
    end
end
