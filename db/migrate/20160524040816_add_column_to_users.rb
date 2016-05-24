class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :integer, :default => 0
    add_column :users, :spin_num, :integer
  end
end
