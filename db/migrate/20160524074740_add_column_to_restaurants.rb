class AddColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :user_id, :integer
  end
end
