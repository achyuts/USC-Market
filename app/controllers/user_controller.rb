class UserController < ApplicationController
	include SessionsHelper
	def create 
		puts "Attempting to create user"
		@user = User.new(params[:user])
		@user.password = params[:password]

		if @user.save!
			# redirect_to :home
			puts "User saved:"
			puts @user
		end
	end

	def index
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
end