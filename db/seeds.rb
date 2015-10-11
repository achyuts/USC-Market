# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def createCategories
	Category.create!({title: "Textbooks"})
	Category.create!({title: "Electronics"})
	Category.create!({title: "Tickets"})
	Category.create!({title: "Services"})
end

def createListing
	title = Faker::Commerce.product_name
	price = Faker::Commerce.price
	description = Faker::Lorem.paragraph

	listing = User.first.listings.create({title: title, price: price, description: description})

	CategoriesListings.create({category_id:Category.all.shuffle.first.id, listing_id: listing.id})
end


def seed
	if User.first.nil?
		u = User.create({first_name: "Jamal", email: "jamalmoo@usc.edu"})
		u.password = "pw"
		u.save!
	end

	createCategories

	for i in 1..10
		createListing
	end
end

seed