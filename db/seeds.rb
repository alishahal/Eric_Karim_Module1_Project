User.destroy_all
Bill.destroy_all
Order.destroy_all
OrderItem.destroy_all

u1 = User.create({name: "Eric"})
u2 = User.create({name: "Karim"})
u3 = User.create({name: "Raul"})
u4 = User.create({name: "Vidhi"})

butter_chicken = OrderItem.create({order_item_name: "Butter Chicken Curry", price: 15.55, description: "A tomato and fenugreek sauce curry with slow cooked chicken and cilantro"})
sayel_lamb = OrderItem.create({order_item_name: "Sayel Lamb Curry", price: 18.40, description: "A stew of Sindhi halal lamb leg, potatoes, and carrots in a cumin sauce"})
saag_paneer = OrderItem.create({order_item_name: "Saag Paneer", price: 13.95, description: "Homemade Paneer cheese with spinach"})
bill_1 = Bill.create({user_id: u1.id, total: 46.00})
order_1 = Order.create({order_item_id: butter_chicken.id, bill_id: bill_1.id})