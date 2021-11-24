class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def confirm
    @carts = Cart.where(customer_id: current_customer.id)
    @total = 0
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    carts = Cart.where(customer_id: current_customer.id)
    carts.each do |cart|
      OrderItem.create(
        order_id: @order.id,
        name: cart.item.name,
        image: cart.item.image,
        price: cart.item.price,
        quantity: cart.quantity
        )
    end
    carts.destroy_all
    redirect_to complete_orders_path
  end

  def complete
  end

  def index
    # 新しい注文順(order(created_at: :desc))
    @orders = Order.where(customer_id: params[:customer_id]).order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
    @total = 0
  end

  private
  def order_params
    params.require(:order).permit(:total_price)
  end

end
