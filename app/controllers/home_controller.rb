class HomeController < ApplicationController
	# include SMSEasyHelper
	def index
		@user = User.new
	end

	def login
		
	end

	def sendText
		puts "SENDING TEXT\n"*100
		# Create the client
		easy = SMSEasy::Client.new

		# Deliver a simple message.
		easy.deliver("3107103460", "verizon", "Hey!") 
		# render :json => []
	end
end