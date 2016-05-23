class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.string  :name
    	t.text	  :description 
    	t.integer :no_of_guest
    	t.integer :price_per_person
    	t.string  :photo
    	t.string  :address
    	t.float   :latitude
    	t.float   :longitude
    	t.integer :contact_number 
    	t.integer :price_tier 
        t.timestamps null: false
    end
  end
end
