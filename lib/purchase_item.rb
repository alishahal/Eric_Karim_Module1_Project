require_relative './pay_bill.rb'
require 'pry'

def create_order(order_item)
    user_order_item = OrderItem.find_by(order_item_name: order_item)
    user = User.find_by(name: $name_input)
    user_bill = Bill.find_or_create_by(user_id: user.id, total: 0.00)
    user_order = Order.create(bill_id: user_bill.id, order_item_id: user_order_item.id)
end

def find_user_bill(name)
    user = User.find_by(name: name)
    user_bill = Bill.find_or_create_by(user_id: user.id)
end

def bill_items(bill)
    # orders = []
    # bill.orders.each do |o|
    #     orders << o.order_item.name
    # end
    # orders
    bill.orders.map{|order|order.order_item.name}
end

def get_item_description(name)
    # item = OrderItem.find_by(order_item_name: name)
    # item.description
    OrderItem.find_by(order_item_name: name).description
end

def buy_order_or_view_bill

    user_choice = $prompt.select("What do you want to do?", ["Order an Entree","View my bill"])

    if user_choice == "Order an Entree"
        entree_choice = $prompt.select("Please select your entree!", ["Saag Paneer","Butter Chicken Curry","Sayel Lamb Curry"])
        case entree_choice
            when "Saag Paneer"
                create_order("Saag Paneer")
            when "Butter Chicken Curry"
                create_order("Butter Chicken Curry")
            when "Sayel Lamb Curry"
                create_order("Sayel Lamb Curry")
        end
    end

    users_bill = find_user_bill($name_input)
    bill_order_items = bill_items(users_bill)

    bill_total = 0
    items_array = []

    bill_order_items.each do |order|
        items_array << order.order_item.order_item_name
        bill_total += order.order_item.price
    end
    
    if users_bill == nil
        puts "You don't have a bill! Buy something!"
    else
        if items_array.length == 0
            puts "You don't have a bill! Buy something!"
        else
            puts "Items currently on your bill: #{items_array.join(", ")}"
            puts "Your total so far is: #{bill_total}"
        end
    end
    
    bill_options = $prompt.select("What would you like to do?", ["Remove an item","View entree menu","Ready to pay the bill"])
    
    if bill_options == "Remove an item"
        if items_array.length != 0
            remove_choice = $prompt.select("What would you like to remove", items_array)
            puts "Item was successfully removed :)"

            removed_item = all_cart_orders.select{|o| o.order_item.order_item_name == remove_choice}.shift
            remaining_items = bill_order_items.reject{|o| o.order_item.order_item_name if order == removed_item}
            removed_item_price = removed_item.order_item.price

            bill_total -= removed_item_price
            bill_array = remaining_items.to_a.map{|o| o.order_item.order_item_name}
            removed_item.destroy

            buy_order_or_view_bill
        else
            puts "There's nothing to remove, friend.. How about you buy something now?"
        end
    elsif bill_options == "View entree menu"
        description = $prompt.select("Select an entree!", ["Saag Paneer", "Butter Chicken Curry", "Sayel Lamb Curry"])
        case description
            when "Saag Paneer"
                puts get_item_description("Saag Paneer")
                buy_order_or_view_bill
            when "Butter Chicken Curry"
                puts get_item_description("Hawaiian")
                buy_order_or_view_bill
            when "Sayel Lamb Curry"
                puts get_item_description("Sayel Lamb Curry")
                buy_order_or_view_bill
        end
    elsif bill_options  == "Ready to pay the bill"
        ready_to_pay?
        user_choice = "DONEZO"
    end
    
    if user_choice == "View my bill"
        if users_bill == nil
            puts "You don't have a bill! Buy something!"
            buy_order_or_view_bill
        else
            if items_array.length == 0
                puts "You don't have a bill! Buy something!"
                buy_order_or_view_bill
            else
                puts "These are the items on your bill so far: #{items_array.join(", ")}"
                puts "The total for you bill is: #{bill_total}"
                binding.pry
            end
        end
    end
end