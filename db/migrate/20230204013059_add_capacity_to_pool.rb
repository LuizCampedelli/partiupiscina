class AddCapacityToPool < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :capacity, :integer
  end
end
