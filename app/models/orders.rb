class Orders < ActiveRecord::Base[5.2]
	belongs_to :bills
	belongs_to :order_item
end