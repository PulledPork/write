class User < ActiveRecord::Base
	# see http://ruby.railstutorial.org/chapters/user-microposts#code-micropost_dependency
	has_many :articles, dependent: :destroy

	# -- Validate/authenticate PASSWORD
	has_secure_password 	# presence validation for password and confirmation auto added here
	validates :password, length: { minimum: 6 }  # validate password length

	# -- Validate EMAIL
	before_save { self.email = email.downcase }					# make email lowercase
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence:   true,							# validate email presence
	                format:     { with: VALID_EMAIL_REGEX },	# validate email format
	                uniqueness: { case_sensitive: false }		# validate email is unique
	
	# -- Validate NAME
	validates :name, presence: true, length: { maximum: 50 }	# validate presence/length of name
	
end

# For more info see:
# http://ruby.railstutorial.org/chapters/modeling-users#code-validates_format_of_email
# 
# FUll HTML: 
# http://ruby.railstutorial.org/chapters/modeling-users#sec-has_secure_password

### >> search for "USER.RB" in ch 6

# ---- ALTERNATE APPROACH, using gem, see here:
# http://code.tutsplus.com/tutorials/how-to-build-an-unobtrusive-login-system-in-rails--net-9194