class OrdersController < ApplicationController
  before_action :move_to_login, only: [:index, :create]

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

end
