class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.page(params[:page]).per(3)
    @cart_new = Cart.new
    @comment = Comment.new
  end
end
