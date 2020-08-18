class ItemOrder
  include ActiveModel::Model
  attr_accessor :price, :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :stock, :item_id, :user_id

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d{11}\z/.freeze

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: POSTAL_CODE_REGEX }
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX }
    validates :item_id
  end

  def save
    Item.update(stock: 0)
    Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, item_id: item_id)
  end
end
