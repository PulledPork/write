class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@articles = Article.all

  	# maybe I can split up @articles_draft and @articles_published here.
  end
end
