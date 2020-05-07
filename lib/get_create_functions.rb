require 'pry'

def create_order(order_item)
    user_order_item = OrderItem.find_by(order_item_name: order_item)
    user = User.find_by(name: $name_input)
    user_bill = Bill.find_or_create_by(user_id: user.id, total: 0.00)
    user_order = Order.create(bill_id: user_bill.id , order_item_id: user_order_item.id)
end

def find_user_bill(name)
    user = User.find_by(name: name)
    user_bill = Bill.find_or_create_by(user_id: user.id)
end

def bill_items(bill)
    bill.orders.map{|order|order.order_item}
end

def get_item_description(name)
    x = OrderItem.find_by(order_item_name: name)
    x.description
end