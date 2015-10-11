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
		@listing.categories << Category.find_by(title: params["listing"]["category"])

		if @listing.save!
			puts "Listing saved!"
			sendAText
		else
			puts "Listing not saved!"
		end

		redirect_to "/"
	end

	def buy
		user = current_user
		# we dont want to show your own listing.. that's stupid
		@listings = Listing.select {|listing| listing.user_id != current_user}
		if !current_user.price_preference.nil?
			@listings = @listings.select {|l| l.price < user.price_preference}
		end
		if !current_user.category_preference.nil?
			@listings = @listings.select {|l| l.id == user.category_preference}
		end

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
		if !params[:id].nil?

			listing = Listing.find(params[:id])

			if !listing.nil?
				Listing.delete(params[:id])
			end
		end
		redirect_to :back
	end

	def sendAText
		puts "TRYHING TO SEND A TECT"
		the_listing = Listing.last
		User.all.each do |user|
			if the_listing.price < user.price_preference && the_listing.categories.first.id == user.category_preference

				puts "FOUND A GOOD PREFERENCE!"
				account_sid = 'ACa4d84a25c189ccd7f4b72ec017ff902c' 
				auth_token = '50d8cda109b9de38f618e43530835f1d' 
				 
				# set up a client to talk to the Twilio REST API 
				@client = Twilio::REST::Client.new account_sid, auth_token 
				
				string = "On Trojan Market: #{the_listing.title} ($#{the_listing.price})!" 
				@client.account.messages.create({
					:from => '+13236095511', 
					:to => user.phone_number, 
					:body => string
				})	
			end
		end
	end
end