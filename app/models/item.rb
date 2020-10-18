class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handing_item
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture

  with_options presence: true do
  validates :category,numericality: { other_than: 1 }
  validates :condition,numericality: { other_than: 1 }
  validates :handing_item,numericality: { other_than: 1 }
  validates :postage,numericality: { other_than: 1 }
  validates :prefecture,numericality: { other_than: 1 }
  end

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
