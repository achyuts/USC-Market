class UserController < ApplicationController
	include SessionsHelper

	def edit

	end

	def create_user 
		puts "Attempting to create user"
		# puts params["user"]["first_name"]
		# params = params[:user]["u"]
		@user = User.new({
			first_name: params["user"][:first_name],
			last_name: params["user"][:last_name],
			facebook_id: params["user"][:facebook_id],
			email: params["user"][:email],
			phone_number: params["user"][:phone_number]})



		if @user.save!
			@user.password = params["user"][:password]
			@user.save!
			# redirect_to :home
			puts "User saved:"
			puts @user
		end
		redirect_to "/"
	end

	def form
		@user = User.new()
	end

	def index
		puts "Home page"

		# puts "SENDING TEXT\n"*10
		# # Create the client
		# easy = SMSEasy::Client.new

		# # Deliver a simple message.
		# easy.deliver("3107103460", "verizon", "Hey!") 

		@user = User.new
	end

	def login
		puts "Attempting to login user"

		puts "Params: " 
		puts params


		# @user = User.select {|u| u.email == params[:email]}
		# @user = @user.first # get User obj, not array
		# if @user.password == params[:password]
		# 
		# end

		if authenticate(params["user"][:email], params["user"][:password]) 
			puts "User #{params}: authenticated"
			redirect_to "/"
		else
			puts "User #{params}: NOT authenticated"
			redirect_to :back
		end
	end

	def logout
		puts "Attempting to logout the user: #{current_user}"
		logout_user
		redirect_to "/"
	end

	def track_postings
		@preferences = []
		if current_user.price_preference.nil? && current_user.category_preference.nil?
			@preferences = nil
		else 
			@preferences = [current_user.price_preference, current_user.category_preference]
		end
	end

	def view_postings
		@postings = current_user.listings
		@listing = Listing.new
	end

	def update_postings
	end

	def update_preferences
	end

	def delete_listing
		puts "Trying to delete listing"
		id  = params[:id]
		listing = Listing.find(id)
		if !listing.nil?
			Listing.delete(id)
		end
		redirect_to :back
	end

	def update_prefs
		puts "Trying to update prefrence for user" * 10
		puts params
		current_user.update({price_preference: params["user"]["price_preference"].to_i, category_preference: params["user"]["category_preference"].to_i })
		redirect_to "/account"

	end
end