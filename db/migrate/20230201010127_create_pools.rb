class CreatePools < ActiveRecord::Migration[7.0]
  def change
    create_table :pools do |t|

      t.timestamps
    end
  end
end
