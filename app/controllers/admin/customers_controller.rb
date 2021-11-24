class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def withdraw
    customer = Customer.find_by(email: params[:email])
    if customer.is_deleted == false
      customer.update(is_deleted: true)
      redirect_to admin_customers_path, alert: '会員ステータスを退会にしました'
    else
      customer.update(is_deleted: false)
      redirect_to admin_customers_path, notice: '会員ステータスを復活させました'
    end
  end

end
