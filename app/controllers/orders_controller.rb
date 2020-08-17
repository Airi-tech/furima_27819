class OrdersController < ApplicationController
  before_action :move_to_login, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private

  def move_to_login
    unless user_signed_in?
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to new_user_session_path
    end
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end  
  end
end
