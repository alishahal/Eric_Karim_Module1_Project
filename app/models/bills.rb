class Bill < ActiveRecord::Base[5.2]
	belongs_to :user
	has_many :orders
  has_many :order_item, through: :orders
end