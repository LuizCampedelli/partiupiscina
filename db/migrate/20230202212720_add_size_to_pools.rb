class AddSizeToPools < ActiveRecord::Migration[7.0]
  def change
    add_column :pools, :size, :integer
  end
end
