class Public::ItemsController < ApplicationController
  def index
    @items = Item.preload(:comments).all.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    @comments = @item.comments.page(params[:page]).per(3)
    @cart_new = Cart.new
    @comment = Comment.new
  end
  
  def search
    if params[:keyword].present?
      @word = params[:keyword]
      @items = Item.where('name LIKE ?', '%'+@word+'%' ).or(Item.where('description LIKE ?', '%'+@word+'%'))
      @items = @items.preload(:comments).page(params[:page]).per(8)
    else
      @items = Item.none.page(params[:page]).per(8)
    end
  end
end
