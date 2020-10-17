class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  with_options presence: true do

  validates :name
  validates :description
  validates :category_id
  validates :condition_id
  validates :price
  validates :postage_id
  validates :prefectures_id
  validates :handing_item_id
  validates :image
  end


end
