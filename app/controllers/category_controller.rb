class CategoryController < ApplicationController
	def api
		render json: Category.all
	end
end