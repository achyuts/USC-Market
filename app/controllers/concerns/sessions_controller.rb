class SessionsController < ApplicationController
	include SessionsHelper
	def new
		session[:last_url] = URI(request.referer || '').path
	end

	def create
		puts params

		if authenticate(params[:username], params[:password])
			puts "LOGIN"

			redirect_to "/"
		else
			puts "NO LOGIN. WRONG UN/PW"
			redirect_to :back
		end
	end
end