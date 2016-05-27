class ChangeRestaurantContactNumber < ActiveRecord::Migration
  def change
    remove_column :restaurants, :contact_number, :integer
    add_column :restaurants, :contact_number, :string
  end
end
