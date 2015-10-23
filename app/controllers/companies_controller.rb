class CompaniesController < ApplicationController

  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(permit_params)
    if @company.save
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end
  
  def destroy
    @company = Company.find(params[:id])

    @company.destroy

    redirect_to companies_path
  end

  private
  def permit_params
     params.require(:company).permit(:name, :rif)
  end
end
