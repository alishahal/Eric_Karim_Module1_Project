class OrderItem < ActiveRecord::Base[5.2]
	has_many :orders
	has_many :bills, through: :orders
end