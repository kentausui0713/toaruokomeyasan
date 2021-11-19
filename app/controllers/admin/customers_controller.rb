class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
    byebug
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def withdraw
    customer = Customer.find_by(params[:id])
    if customer.is_deleted == false
      customer.is_deleted = true
    else
      customer.is_deleted = false
    end
    customer.update
    redirect_to admin_customers_path
  end

end
