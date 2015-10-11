class ListingController < ApplicationController
	include SessionsHelper
	def buy
		user = current_user
		# we dont want to show your own listing.. that's stupid
		@listings = Listing.select {|listing| listing.user_id != current_user}
	end

	def sell
		@listing = Listing.new
	end

	def api
		category = Category.find_by(title: params[:category_name])
		if category.nil?
			render :json => { error: "No category found"}
		else

			listings = Listing.select do |listing|
				listing.categories.include?(category)
			end		
			render json: listings.to_json
		end
	end

end