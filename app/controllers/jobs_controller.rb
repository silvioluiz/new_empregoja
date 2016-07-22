class JobsController < ApplicationController

  before_action :set_collections, only: [:new, :edit]
  before_action :find_job, only: [:edit, :update, :show]

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)		
		if @job.valid?
			@job.save
			redirect_to @job
		else
			set_collections
			flash.now[:error] = 'Não foi possível criar a vaga'
			render 'new'	
		end
	end

	def update
		if @job.update(job_params)			
			redirect_to @job
		else
			set_collections
			flash.now[:error] = 'Não foi possível atualizar a vaga'
			render 'edit'	
		end
	end

	private

	def job_params
		params.require(:job).permit(:title, :location, :category_id, :company_id, :description, :featured)
	end

	def set_collections
		@companies = Company.all
		@categories = Category.all
	end

  def find_job
    @job = Job.find(params[:id])
  end

end