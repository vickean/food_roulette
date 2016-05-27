class AddPreferToPreferences < ActiveRecord::Migration
  def change
    add_column :preferences, :prefer, :boolean , default: false 
  end
end
