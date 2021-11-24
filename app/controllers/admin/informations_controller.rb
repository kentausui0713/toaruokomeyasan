class Admin::InformationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @informations = Information.all.order(id: "DESC")
    @information_new = Information.new
  end

  def create
    @info = Information.new(information_params)
    @info.save
    redirect_to admin_information_path(@info.id)
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
