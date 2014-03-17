class ArticlesController < ApplicationController
	
	def show
		@article = Article.find(params[:id])
	end

	def edit
		@article = Article.find(params[:id])
	end
end
