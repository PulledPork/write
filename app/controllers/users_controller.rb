class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = "You have successfully registered"
      redirect_to @user # if saved successfully, display user page
    else
      render 'new' # if not successful, render errrors
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def show
  	@user = User.find(params[:id])
  	@published_articles = @user.articles.published
    @drafts = @user.articles.drafts
	end
	
	private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
	
end