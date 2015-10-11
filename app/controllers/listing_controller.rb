class ListingController < ApplicationController
	include SessionsHelper

	def new
		@listing = Listing.new
	end

	def create
		puts "Attempting to create a listing"
		puts "Parameters" + "\n" * 5
		puts params

		if current_user.nil?
			redirect_to "/"
		end

		listing_params = Hash.new
		params["listing"].each {|k, v| listing_params[k.to_sym] = v}
		@listing = current_user.listings.new(listing_params)

		if @listing.save!
			puts "Listing saved!"
		else
			puts "Listing not saved!"
		end

		redirect_to "/"
	end

	def buy
		user = current_user
		# we dont want to show your own listing.. that's stupid
		@listings = Listing.select {|listing| listing.user_id != current_user}

		# newest listings at the top
		@listings.sort_by &:created_at
		@listings.reverse!
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

	def delete
		return if params[:id].nil?

		listing = Listing.find(params[:id])

		if !listing.nil?
			Listing.delete(params[:id])
		end
	end
end