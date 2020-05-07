require_relative './pay_bill.rb'
require_relative './get_create_functions.rb'
require 'pry'

def buy_order_or_view_bill
   
    bill_options = $prompt.select("What would you like to do?", ["Order an entree, please!", "Could you tell me about a menu item?", "I'd like to view my bill so far.", "I would love a treat on the house!"])
    
    if bill_options == "Could you tell me about a menu item?"
        description = $prompt.select("Select an entree!", ["Saag Paneer", "Butter Chicken Curry", "Sayel Lamb Curry"])
        case description
            when "Saag Paneer"
                puts get_item_description("Saag Paneer")
                puts "13.95"
                buy_order_or_view_bill
            when "Butter Chicken Curry"
                puts get_item_description("Butter Chicken Curry")
                puts "15.55"
                buy_order_or_view_bill
            when "Sayel Lamb Curry"
                puts get_item_description("Sayel Lamb Curry")
                puts "18.4"
                buy_order_or_view_bill
        end
    
    elsif bill_options == "Order an entree, please!"

        entree_choice = $prompt.select("Please select your entree!", ["Saag Paneer", "Butter Chicken Curry", "Sayel Lamb Curry"])
        case entree_choice
            when "Saag Paneer"
                create_order("Saag Paneer")
            when "Butter Chicken Curry"
                create_order("Butter Chicken Curry")
            when "Sayel Lamb Curry"
                create_order("Sayel Lamb Curry")
        end
        buy_order_or_view_bill

    elsif bill_options == "I would love a treat on the house!"

        gulab = "This is Gulab Jamun! A shockingly-sweet syrup-soaked milk ball. Cheers!"
        ladoo = "This is a Coconut Ladoo! A tiny sphere of coconut, chopped nuts, and goodness. Cheers!"
        ics = "This is a Bournvita Ice Cream Sandwhich. We made ice cream out of the classic malt drink for children, then smacked it in between two Parle G cookies! Yeah. It's crazy good."
        array = [gulab,ladoo,ics]
        puts array.sample.to_s
        buy_order_or_view_bill


    elsif bill_options == "I'd like to view my bill so far."
        
        users_bill = find_user_bill($name_input)
        bill_order_items = bill_items(users_bill)

        bill_total = 0
        items_array = []

        bill_order_items.each do |order|
            items_array << order.order_item_name
            bill_total += order.price
        end

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
                ready_to_pay?
            end
        end
    end
end

