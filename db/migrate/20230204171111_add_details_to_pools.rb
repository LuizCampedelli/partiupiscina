class AddDetailsToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :address, :string
    add_column :pools, :latitude, :float
    add_column :pools, :longitude, :float
  end
end
