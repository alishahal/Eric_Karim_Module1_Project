require_relative './config/environment.rb'
require_relative './lib/p_buy_view.rb'
require_relative './lib/p_readyforcheckout.rb'
require_relative './lib/p_finduser.rb'

$prompt = TTY::Prompt.new()

def begin_service
    a = Artii::Base.new(:font => 'slant')

    puts a.asciify("Welcome to Eric and Karim's Indian Cuisine!")

    puts "Let's get started. What's your name?"
    $name_input = gets.strip

    find_user
    
    buy_order_or_view_bill
end

begin_service