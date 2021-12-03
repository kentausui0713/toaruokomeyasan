class Public::CartsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @carts = current_customer.carts
    @total = 0
    # エラー文の変数指定(cartのデータならなんでもいい)
    @cart = Cart.where(customer_id: current_customer.id).last
  end

  def create
    cart = Cart.new(cart_params)
    if cart.save
      redirect_to carts_path
    end
  end

  def update
    @cart = Cart.find(params[:id])
    if @cart.update(cart_params)
      redirect_to carts_path
    else
      @carts = current_customer.carts
      @total = 0
      render :index
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    cart.destroy
    redirect_to carts_path
  end

  def destroy_all
    cart = current_customer.carts
    cart.destroy_all
    redirect_to carts_path
  end

  private
  def cart_params
    params.require(:cart).permit(:quantity, :item_id, :customer_id)
  end

end
