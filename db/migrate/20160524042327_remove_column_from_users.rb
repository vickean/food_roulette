class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :low_spin_num, :integer
    remove_column :users, :med_spin_num, :integer
    remove_column :users, :hi_spin_num, :integer
  end
end
