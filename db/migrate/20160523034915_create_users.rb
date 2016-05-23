class CreateUsers < ActiveRecord::Migration
	def change
	  create_table :users do |t|
	      t.timestamps null: false
	      t.string :first_name
	      t.string :last_name
	      t.string :gender
	      t.string :avatar
	      t.text :description
	      t.integer :low_spin_num
	      t.integer :med_spin_num
	      t.integer :hi_spin_num
	      t.string :email, null: false
	      t.string :encrypted_password, limit: 128, null: false
	      t.string :confirmation_token, limit: 128
	      t.string :remember_token, limit: 128, null: false
	    end

	    add_index :users, :email
	    add_index :users, :remember_token
	end
end

