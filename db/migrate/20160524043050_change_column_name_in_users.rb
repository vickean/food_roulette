class ChangeColumnNameInUsers < ActiveRecord::Migration
  def change
  	rename_column :users, :type, :user_type
  	remove_column :users, :med_spin_num, :integer
    remove_column :users, :hi_spin_num, :integer
  end
end
