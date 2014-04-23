# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

joe = User.create!(email: 'joe@gmail.com',
		     		password: 'secret1234')
bob = User.create!(email: 'bob@yahoo.com',
					password: '12345678')
susan = User.create!(email: 'susan@aol.com',
					password: 'susanrox')