class UserPurchase

  include ActiveModel::Model
  attr_accessor :token, :price, :post_number, :prefecture_id, :city, :house_number, :building_name, :phone_number ,:user_id ,:item_id

  with_options presence: true do
  validates :token
  validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
  validates :prefecture_id, numericality: { other_than: 0, message: "must be other than --" }
  validates :city
  validates :house_number
  validates :phone_number, format: { with: /\A\d{11}\z/}
  validates :user_id
  validates :item_id
  end

  def save
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: @purchase.id, post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
  end
end
