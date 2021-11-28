class Public::InformationsController < ApplicationController
  def index
    @informations = Information.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @information = Information.find(params[:id])
  end
end
