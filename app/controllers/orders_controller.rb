class OrdersController < ApplicationController
  def new
    @company = Company.find(params[:company_id])
    @order = @company.orders.build
  end

  def create
    @company = Company.find(params[:company_id])
    @order = @company.orders.build(permit_params)
    if @order.save
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def destroy
    @company = Company.find(params[:company_id])
    @order = @company.orders.where(id: params[:id]).take

    @order.destroy

    redirect_to company_path(@company)
  end

  private
  def permit_params
    params.require(:order).permit(:description, :date, :person_id)
  end
end
