class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.find_by(email: current_customer.email)
  end

  def edit
    @customer = Customer.find_by(email: current_customer.email)
  end

  def update
    customer = Customer.find_by(email: current_customer.email)
    if customer.update(customer_params)
      redirect_to customer_path(customer)
    else
      render :edit
    end
  end

  def withdraw
    customer = Customer.find_by(email: current_customer.email)
    customer.update(is_deleted: true)
    sign_out current_customer
    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :name_kana, :phone_num, :address, :postal_code, :email, :is_deleted)
    end
end
