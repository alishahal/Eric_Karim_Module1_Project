class CreateOrders <  ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :bill_id
      t.integer :order_item_id
    end
  end
end