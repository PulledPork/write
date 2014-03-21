class ArticlesController < ApplicationController
	
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

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to user_path(@article.user)
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end