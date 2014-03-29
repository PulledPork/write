module SessionsHelper
	
	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.hash(remember_token))
		self.current_user = user
	end
	def signed_in?
		!current_user.nil? #if current_user is NOT nil, then user is signed in
	end

	def sign_out
		current_user.update_attribute(:remember_token,
	                              User.hash(User.new_remember_token))
		cookies.delete(:remember_token)
		self.current_user = nil
	end

	def current_user=(user)
		@current_user = user 	# Just setting a variable for later
	end

	def current_user
		remember_token = User.hash(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
		#   ||= (“or equals”) sets the @current_user instance variable
		# to the user corresponding to the remember token, 
		# but only if @current_user is undefined.
	end
end