class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
		flash.now[:notice] = 'Nenhuma vaga disponível' if @category.jobs.empty?
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params.require(:category).permit(:name))
		
		if @category.valid?
			@category.save
			redirect_to @category
		else
			flash.now[:error] = 'Não foi possível cadastrar a categoria'
			render 'new'		
		end

	end
end