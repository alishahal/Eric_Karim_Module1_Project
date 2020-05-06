require 'pry'

def pay
    ## room here for past items
    ## room here for redeeming old stuff

    current_user = User.find_by(name: $name_input)
    users_bill = Bill.find_by(user_id: current_user.id)

    bill_total = 0
    bill_items = []

    users_bill.orders.each do |order|
        bill_items << order.item.item_name
        bill_total += order.item.price
    end

    users_bill.orders.clear
    puts "placeholder thank you"
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