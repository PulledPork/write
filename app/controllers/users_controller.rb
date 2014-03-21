class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@articles = @user.articles

#	  @articles.each do |article|
#  		if(is_draft)
#			do "in progress" articles DIV
#		else
#			do "published" articles DIV
#		end
	end
	
  	# maybe I can split up @articles_draft and @articles_published here.
  	#Not sure how to seperate the articles and drafts based on the is_draft db flag T/F
	
end
