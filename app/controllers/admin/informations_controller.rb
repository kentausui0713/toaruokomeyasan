class Admin::InformationsController < ApplicationController
before_action :authenticate_admin!

  def index
    @informations = Information.all.order(id: "DESC").page(params[:page]).per(10)
    @information = Information.new
  end

  def create
    @information = Information.new(information_params)
    if @information.save
      redirect_to admin_information_path(@information.id)
    else
      @informations = Information.all.order(id: "DESC")
      render :index
    end
  end

  def show
    @information = Information.find(params[:id])
  end

  def destroy
    info = Information.find(params[:id])
    info.destroy
    redirect_to admin_informations_path
  end

  private
  def information_params
    params.require(:information).permit(:title, :content)
  end

end
