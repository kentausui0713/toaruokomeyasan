class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @orders = Order.where(customer_id: params[:customer_id]).order(created_at: :desc).page(params[:page]).per(10)
  end

  def index_all
    @order_all = Order.all.order(created_at: :desc).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: @order.id)
    @total = 0
  end
end
