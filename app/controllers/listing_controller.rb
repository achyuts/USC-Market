class ListingController < ApplicationController
	def buy_listings
		user = current_user
		@listings = Listing.select do |listing|

			# we dont want to show your own listing.. that's stupid
			if current_user != listing.user_id
			end
		end
	end

	def sell_listings

	end
end