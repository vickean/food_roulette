class DatabaseCleanup < ActiveRecord::Migration

  def change
  	rename_column :restaurants, :no_of_guest, :no_of_guests
  	rename_column :restaurants, :photo, :picture
	add_column :restaurants, :day_active, :integer
	add_column :users, :address, :text
	add_column :users, :latitude, :float
	add_column :users, :longitude, :float
  end

create_table :bookings do |t|
		  t.integer :user_id
		  t.integer :party_id
	      t.timestamps null: false
	    end

create_table :parties do |t|
		  t.integer :restaurant_id
		  t.integer :number_of_people
		  t.text :party_name
	      t.datetime :datetime
	      t.timestamps null: false
	    end

create_table :preferences do |t|
		  t.integer :preferer_id
		  t.integer :preferee_id
	      t.timestamps null: false
	    end

end

