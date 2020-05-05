class User < ActiveRecord::Base[5.2]
  has_many :orders, through :bills
   
end