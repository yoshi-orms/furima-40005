class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one_attached :address
end