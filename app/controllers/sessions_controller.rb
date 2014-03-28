class SessionsController < ApplicationController

	def new
		#just exists to setup new.HTML.erb page
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			#they are who they say they are, show them profile
			sign_in(user)	# custom function
			redirect_to user
		else
			#they lie! show errors
			flash.now[:danger] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
		
	end
end