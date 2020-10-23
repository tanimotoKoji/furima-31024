FactoryBot.define do
  factory :item do
    
    association :user 
    name                 { "tech" }
    description          { "お買い得です" }
    category_id          { 2 }
    condition_id         { 3 }
    postage_id           { 2 }
    prefecture_id        { 8 }
    handing_item_id      { 2 }
    price                { 3000 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
end
end