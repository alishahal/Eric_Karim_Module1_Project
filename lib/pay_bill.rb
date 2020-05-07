require 'pry'

def pay
    users_bill = find_user_bill($name_input)
    bill_order_items = bill_items(users_bill)  
    
    total = 0
    bill_order_items.each{|order|total+=order.price}
    puts total.to_s
    
    users_bill.orders.clear
    puts "Thank you so much! Have a dope day!"
end

def ready_to_pay?
    loop do
        user_choice = $prompt.select("Are you ready to pay your bill?", ["Yes","No"])
        case user_choice
        when "No"
            buy_order_or_view_bill
        when "Yes"
            pay
            break
        end
    end
end