class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save do
      redirect_to @user # if saved successfully, display user page
    else
      render 'new' # if not successful, render errrors
    end
  end
  
  def show
  	@user = User.find(params[:id])
  	@published_articles = @user.articles.published
    @drafts = @user.articles.drafts

#	  @articles.each do |article|
#  		if(is_draft)
#			do "in progress" articles DIV
#		else
#			do "published" articles DIV
#		end
	end
	
	private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
	
end
