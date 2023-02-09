class Order < ApplicationRecord
  belongs_to :pool
  belongs_to :user
  
end
