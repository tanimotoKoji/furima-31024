FactoryBot.define do
  factory :item do
    #image {Faker::Lorem.sentence}
    association :user 
    name                 { "tech" }
    description          { "お買い得です" }
    category_id          { 2 }
    condition_id         { 3 }
    postage_id           { 2 }
    prefecture_id        { 8 }
    handing_item_id      { 2 }
    price                { 3000 }
end
end