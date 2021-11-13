class Public::CartsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @carts = Cart.where(customer_id: current_customer.id)
    @total = 0
  end

  def create
    cart = Cart.new(cart_params)
    cart.customer_id = current_customer.id
    cart.save
    redirect_to carts_path
  end

  def update
    cart = Cart.find(params[:id])
    cart.update(cart_params)
    redirect_to carts_path
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

  def destroy_all
    cart = Cart.where(customer_id: current_customer.id)
    cart.destroy_all
    redirect_to carts_path
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity, :item_id)
  end

end
