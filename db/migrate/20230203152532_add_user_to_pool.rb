class AddUserToPool < ActiveRecord::Migration[7.0]
  def change
    add_reference :pools, :user, null: false, foreign_key: true
  end
end
