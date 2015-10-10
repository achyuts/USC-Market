module SessionsHelper
	def logged_in?
		!current_user.nil?	
	end

	def current_user
		return nil unless current_user_id != nil
		@current_user ||= User.find(current_user_id)
	end

	def current_user_id
		session[:current_user_id]
	end

	def logout
		puts "Trying to logout"
		session.delete :current_user_id
		@current_user = nil
	end 

	def set_current_user (user) 
		session[:current_user_id] = user.id
		@current_user = user
	end

	def authenticate (email, password)
		candidate = User.find_by(:email => email)
		if !candidate.blank?
			if candidate.password_hash.blank?
				# use unsafe old password
				set_current_user(candidate) if candidate.read_attribute(:password) == password
			else 
				# use bycrpyt override
				if candidate.password == password
					set_current_user(candidate) 
				else 
					
				end
			end
		else
			false
		end
	end

	# def get_products
		# session['cart']['products']
	# end
end