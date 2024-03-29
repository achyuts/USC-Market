require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt

	has_many :listings
	has_many :preferences


	def password
		@password ||= Password.new(self.password_hash)
		# @password ||= "wraaasg"
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
