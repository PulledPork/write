class ArticlesController < ApplicationController
	
	# not sure if this is the route to go yet.. needs to NOT include drafts
	def index_all_users
		@articles = Article.all
	end

	# -- IS nested: index, new, create
	def index
		@user = User.find(params[:user_id])
		@articles = @user.articles
	end

	def new
		@user = User.find(params[:user_id])
		#@user.articles.build  #--this line breaks the code for some reason...
		@article = Article.new
	end

	def create
		@user = User.find(params[:user_id])
		@article = @user.articles.create(article_params)

		@article.save
		redirect_to @article
	end

	# -- NOT nested: show, edit, update, destroy
	def show
		@article = Article.find(params[:id])
		@user = @article.user
	end

	def edit
		@article = Article.find(params[:id])
		@user = @article.user
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to user_articles_path(@article.user)
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end