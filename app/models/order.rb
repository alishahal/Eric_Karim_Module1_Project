class Order < ActiveRecord::Base
	belongs_to :bills
	belongs_to :order_item
end