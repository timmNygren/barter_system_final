# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Barter.delete_all
joe = User.create!(email: 'joe@gmail.com',
		     		password: 'secret1234',
		     		first_name: 'Joe',
		     		last_name: 'Schmoe',
		     		display_name: 'Schmoej')
bob = User.create!(email: 'bob@yahoo.com',
					password: '12345678',
					first_name: 'Bobby',
					last_name: 'Bouche',
					display_name: 'William')
susan = User.create!(email: 'susan@aol.com',
					password: 'susanrox',
					first_name: 'Susan',
					last_name: 'Strong',
					display_name: 'Raggle')

Barter.create!(seller: joe.id, selling: "calculus textbook", buyer: susan.id, offer: "diff eq textbook")
Barter.create!(seller: joe.id, selling: "calculus textbook", buyer: susan.id, offer: "iclicker")
Barter.create!(seller: joe.id, selling: "calculus textbook", buyer: bob.id, offer: "ti-89")
Barter.create!(seller: joe.id, selling: "calculus textbook", buyer: bob.id, offer: "really expensive graph paper")
Barter.create!(seller: bob.id, selling: "calculus textbook", buyer: joe.id, offer: "calculus textbook") # troll bid
Barter.create!(seller: bob.id, selling: "physics tutoring", buyer: susan.id, offer: "solidworks tutoring")
Barter.create!(seller: bob.id, selling: "statics tutoring", buyer: susan.id, offer: "solidworks tutoring")
Barter.create!(seller: susan.id, selling: "ti-89 titanium", buyer: joe.id, offer: "calculus textbook")
Barter.create!(seller: susan.id, selling: "iclicker", buyer: bob.id, offer: "drafting utensils")
Barter.create!(seller: susan.id, selling: "slide rule", buyer: joe.id, offer: "a real ruler") # a bad trade
Barter.create!(seller: susan.id, selling: "calipers", buyer: bob.id, offer: "electronic calipers")