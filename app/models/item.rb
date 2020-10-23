class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :handing_item
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture

  with_options presence: true do
  validates :category_id, numericality: { other_than: 1, message: "must be other than --"}
  validates :condition_id, numericality: { other_than: 1, message: "must be other than --"}
  validates :handing_item_id, numericality: { other_than: 1, message: "must be other than --"}
  validates :postage_id, numericality: { other_than: 1, message: "must be other than --"}
  validates :prefecture_id, numericality: { other_than: 0, message: "must be other than --"}
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase

  with_options presence: true do
  validates :name
  validates :description
  validates :image
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :price,format: {with: /\A[0-9]+\z/}
  end
end
