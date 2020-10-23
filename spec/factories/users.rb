FactoryBot.define do

  password = Faker::Internet.password(min_length: 6)

  
  factory :user do
    nickname             { "koji" }
    email                { Faker::Internet.email }
    password             { password }
    password_confirmation { password }
    last_name            { "たにもと" }
    first_name           { "こうじ" }
    last_name_kana       { "タニモト" }
    first_name_kana      { "コウジ" }
    birth_date           { "1999-01-01"}
   
   end
end