require_relative './config/environment.rb'
require_relative './lib/purchase_item.rb'
require_relative './lib/pay_bill.rb'
require_relative './lib/find_user.rb'

$prompt = TTY::Prompt.new()

def begin_service
    a = Artii::Base.new(:font => 'slant')

    puts a.asciify("Welcome")

    puts "Let's get started. What's your name?"
    $name_input = gets.strip

    find_user
    
    buy_order_or_view_bill
end

begin_service