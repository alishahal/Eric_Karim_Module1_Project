class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.string :order_item_name
      t.float :price 
      t.string :description 
      t.timestamps
    end

  end
end