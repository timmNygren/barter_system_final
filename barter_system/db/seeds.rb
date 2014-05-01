# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Auction.delete_all
Swap.delete_all

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

calc_textbook = Auction.create!(auction_name: "Calc Textbook",
                               auction_description: "That one textbook, you know the one",
                               user_id: joe.id,
                               available: true,
                               image: File.open(File.join(Rails.root, "app/assets/images/books.jpg")))

ti89 = Auction.create!(auction_name: "TI-89 Calculator",
                      auction_description: "The best one there is",
                      user_id: bob.id,
                      available: true,
                      image: File.open(File.join(Rails.root, "app/assets/images/books.jpg")))

clicker = Auction.create!(auction_name: "iClicker",
                         auction_description: "Slightly used iClicker",
                         user_id: susan.id,
                         available: false,
                         image: File.open(File.join(Rails.root, "app/assets/images/books.jpg")))

Swap.create(auction_id: calc_textbook.id,
            offer_id: ti89.id,
            state: "Open")

Swap.create(auction_id: clicker.id,
            offer_id: calc_textbook.id,
            state: "Accepted")

Swap.create(auction_id: calc_textbook.id,
            offer_id: clicker.id,
            state: "Denied")