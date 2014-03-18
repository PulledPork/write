class User < ActiveRecord::Base
	has_many :articles, dependent: :destroy
	# see http://ruby.railstutorial.org/chapters/user-microposts#code-micropost_dependency


end

# For more info see:
# http://ruby.railstutorial.org/chapters/modeling-users#code-validates_format_of_email
# 
# FUll HTML: 
# http://ruby.railstutorial.org/chapters/modeling-users#sec-has_secure_password

### >> search for "USER.RB" in ch 6