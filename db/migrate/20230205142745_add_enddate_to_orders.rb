class AddEnddateToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :enddate, :date
  end
end
