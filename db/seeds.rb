# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(email: 'example@mail.com' , password: '123123123' , password_confirmation: '123123123')
p user
profile = Profile.create!(first_name: 'foo', last_name: 'bar', ex_email: user.email)
cc = CreditCard.create!(card_number: '120983452309482309',
    card_exp_date: "2023-10-01",
    card_cvc_number: "483",
    profile: profile)
p cc 
