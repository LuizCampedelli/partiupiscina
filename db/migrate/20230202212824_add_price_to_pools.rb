class AddPriceToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :price, :integer
  end
end
