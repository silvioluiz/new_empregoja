class CompaniesController < ApplicationController
  
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(params.require(:company)
      .permit(:name, :location, :mail, :phone) )
    
    if @company.valid?
      @company.save
      redirect_to @company
    else

    end    
  end

  def show
    @company = Company.find(params[:id])
    flash.now[:notice] = 'Nenhuma vaga disponível' if @company.jobs.empty?
  end

end