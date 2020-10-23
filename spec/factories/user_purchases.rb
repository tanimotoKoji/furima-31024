FactoryBot.define do
  
  factory :user_purchase do
    
      association :item
      association :user
      token                {"tok_abcdefghijk00000000000000000"}
      post_number          { "711-1111" }
      prefecture_id        { 2 }
      city                 { "奈良市押熊町" }
      house_number         { "3-3-3" }
      phone_number         { "09080045665" }
  end

end
