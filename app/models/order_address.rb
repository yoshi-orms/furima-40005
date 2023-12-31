class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :street, :building, :phone_number, :user_id, :item_id, :token

  ZIP_CODE_FORMAT = /\A\d{3}-\d{4}\z/.freeze
  PHONE_NUMBER_FORMAT = /\A\d{10,11}\z/.freeze

  validates :zip_code, presence: true, format: { with: ZIP_CODE_FORMAT }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :city, :street, :token, :user_id, :item_id, presence: true
  validates :phone_number, presence: true, format: { with: PHONE_NUMBER_FORMAT }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    order_id = order.id

    Address.create(
      zip_code: zip_code,
      prefecture_id: prefecture_id,
      city: city,
      street: street,
      building: building,
      phone_number: phone_number,
      order_id: order_id
    )
  end
end