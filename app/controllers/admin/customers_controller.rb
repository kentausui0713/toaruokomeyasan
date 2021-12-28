class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.all.order(id: "DESC").page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def withdraw
    customer = Customer.find_by(email: params[:email])
    if customer.is_deleted == false
      customer.update(is_deleted: true)
      flash[:alert] = "会員ステータスを無効にしました"
      redirect_back(fallback_location: root_path)
    else
      customer.update(is_deleted: false)
      flash[:notice] = "会員ステータスを有効にしました"
      redirect_back(fallback_location: root_path)
    end
  end
  
  def search
    if params[:keyword].present?
      @keyword = params[:keyword]
      # Customerのname、email、phone_numで部分検索(長くなるので変数に)
      search_name = Customer.where('name LIKE ?','%'+@keyword+'%')
      search_email = Customer.where('email LIKE ?','%'+@keyword+'%')
      search_phone = Customer.where('phone_num LIKE ?','%'+@keyword+'%')
      
      @customers = search_name.or(search_email).or(search_phone)
      @customers = @customers.order(id: "DESC").page(params[:page])
    else
      @customers = Customer.none
    end
  end

end
