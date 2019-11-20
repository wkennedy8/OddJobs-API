rails db:drop db:create

rails db:environment:set RAILS_ENV=development

rails db:migrate

rails g scaffold User name email password_digest

rails g scaffold City \
    name:string

rails g scaffold ZipCode \
    value:string

rails g scaffold city_zip_code city:references zip_code:references

rails g scaffold State \
    name:string

rails g scaffold Address \
    street1:string \
    street2 \
    city_zip_code:references \
    state:references

rails g scaffold UserProfile \
    first_name \
    last_name \
    ex_email \
    address:references

rails g scaffold Contractor \
    first_name \
    last_name \
    background_check:boolean

rails g scaffold JobCategory \
    name

rails g scaffold job_category_contractor job_category:references contractor:references

rails g scaffold Contract \
    status \
    contractor:references \
    user_profile:references

rails g scaffold JobPosting \
    title \
    description:text \
    job_category:references \
    contract:references \
    user_profile:references
    
# job_posting has_one contract
# contract belongs_to job_posting
# see https://stackoverflow.com/a/861899/1913726

rails g scaffold JobImage \
    url \
    job_posting:references

rails g scaffold CreditCard \
    card_number \
    card_exp_date:date \
    card_cvc_number \
    user_profile:references

rails g scaffold ContractorImage \
    url \
    contractor:references

rails g scaffold Phone \
    kind:integer \
    value \
    user_profile:references

rails g scaffold UserImage \
    url \
    user_profile:references

rails g scaffold Rating \
    value:integer \
    review_text:text \
    user_profile:references \
    contractor:references

rails db:migrate
