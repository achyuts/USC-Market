require 'rubygems'
require 'twilio-ruby'  
class HomeController < ApplicationController
	# include SMSEasyHelper
	def index
		@user = User.new
	end

	def login
		
	end

	def sendText
 
		# put your own credentials here 
		account_sid = 'ACa4d84a25c189ccd7f4b72ec017ff902c' 
		auth_token = '50d8cda109b9de38f618e43530835f1d' 
		 
		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => '+13236095511', 
			:to => '13107103460', 
			:body => 'Hey!',  
		})
	end
end