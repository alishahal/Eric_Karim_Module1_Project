require_relative './pay_bill.rb'
require 'pry'

def create_order(order_item)
    user_order_item = OrderItem.find_by(order_item_name: order_item)
    user = User.find_by(name: $name_input)
    user_bill = Bill.find_or_create_by(user_id: user.id)
    user_order = Order.create(order_item_id: user_order_item.id, bill_id: user_bill.id)
end

def find_user_bill(name)
    user = User.find_by(name: name)
    user_bill = Bill.find_or_create_by(user_id: user.id)
end

def bill_items(bill)
    orders = []
    bill.orders.each do |o|
        orders << o.order_item.name
    end
    orders
end

def buy_order_or_view_bill

end