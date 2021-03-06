class ArticlesController < ApplicationController
	
	# -- Seperately defined resource
	def index
		@articles = Article.published
		#this is defined in the Model (all published posts)
	end

	# -- IS nested: new, create
	def new
		@user = User.find(params[:user_id])
		@article = Article.new
		#@user.articles.build  #--this line breaks the code for some reason...
		#@article = @user.articles.create()
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

		redirect_to user_path(@article.user)
	end

	def publish
		@article = Article.find(params[:id])
		@article.publish  # custom method defined in Model

		redirect_to article_path(@article)
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end