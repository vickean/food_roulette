# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


restaurant_list = [
	["Ministry of Fish Head Curry","Seafood restaurant","8","15","Menara Glomac","3.100249","101.592005","03-7733 9656","1","1"],
	["Bruno's Pizza Bar","We celebrate the italian way of life buon appetito","8","30","Glo Glomac","3.100249","101.592005","03-77336044","2","1"],
	["SS20 Fish Head Noodle ","Fish Head noodle restaurant","8","15","Damansara Kim","3.138153","101.627725","012-6288896","1","1"],
	["KomPassion Thai Fusion Food ","Thai restaurant","8","30","Damansara Kim","3.134770","101.627395","03-77319256","2","1"],
	["The Kitchen Table","Restaurant & Bakery","8","30","Damansara Kim","3.134770","101.627395","03-77334000","2","1"],
	["The Locker & Loft","Restaurant & Pub","8","30","Damansara Kim","3.134770","101.627395","03-77334111","2","1"],
	["SoLEIL","French Restaurant","8","45","Damansara Kim","3.125926","101.637297","03-79325989","3","1"],
	["pietro ","Ristorante Italiano","8","45","Jalan Damansara Endah","3.149243","101.665213","03-20935433","3","1"],
	["IDC KL Ice Cream Dessert Coffee ","Ice Cream from new zealand","8","15","Damansara Kim","3.138153","01.627725","03-77336000","1","1"],
	["Imara Mediterranean Cuisine","Mediterranean Cuisine","8","30","Glo Glomac","3.100249","101.592005","03-77338635","2","1"]
]


restaurant_list.each do |name, description, no_of_guests, price_per_person,address,latitude,longitude,contact_number,price_tier,day_active|
	Restaurant.create(name: name, description: description, no_of_guests: no_of_guests, price_per_person: price_per_person,address: address,latitude: latitude,longitude: longitude,contact_number:contact_number, price_tier: price_tier,day_active: day_active)

end 