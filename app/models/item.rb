class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery
  
  belongs_to :user
  has_many :comments
  has_one :order
  has_one :destination
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :category_id,             numericality: { other_than: 1, message: 'Select' }
    validates :sales_status_id,         numericality: { other_than: 1, message: 'Select' }
    validates :shipping_fee_status_id,  numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id,           numericality: { other_than: 1, message: 'Select' }
    validates :scheduled_delivery_id,   numericality: { other_than: 1, message: 'Select' }
  end

  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end

  validates :price, presence: true, numericality:
  { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end

