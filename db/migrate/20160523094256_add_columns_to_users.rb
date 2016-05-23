class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :avatar, :string
    add_column :users, :description, :text
    add_column :users, :low_spin_num, :integer
    add_column :users, :med_spin_num, :integer
    add_column :users, :hi_spin_num, :integer
  end
end
