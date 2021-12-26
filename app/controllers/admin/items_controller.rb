class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order(id: "DESC").page(params[:page]).per(6)
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_items_path
  end
  
  def search
    if params[:keyword].present?
      @keyword = params[:keyword]
      @items = Item.where('name LIKE ?', '%'+@keyword+'%').order(id: "DESC").page(params[:page]).per(6)
    else
      @items = Item.none.page(params[:page])
    end
  end

  private
   def item_params
     params.require(:item).permit(:name, :image, :price, :description)
   end
end
