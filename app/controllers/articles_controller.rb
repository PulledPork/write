class ArticlesController < ApplicationController
	
	def new
		#@article = Article.new
		@user = User.find(params[:user_id])
		@user.articles.build #is synonomous, but doesn't work in this context
	end

	def create
		@user = User.find(params[:user_id])
		@article = @user.articles.create(article_params)

		@article.save
		redirect_to @article
	end

	def show
		#@user = User.find(params[:user_id])
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def index
		@articles = Article.all
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end