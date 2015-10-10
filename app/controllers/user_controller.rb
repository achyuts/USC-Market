class UsersController < ApplicationController
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

	def login
		# @user = User.select {|u| u.email == params[:email]}
		# @user = @user.first # get User obj, not array
		# if @user.password == params[:password]
		# 
		# end

		# if authenticate(params[:email], params[:password]) 
		# 	puts "User #{params}: authenticated"
		# else
		# 	puts "User #{params}: NOT authenticated"
		# end
	end
end