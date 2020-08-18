class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_login, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]

  def index
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:price, :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :stock, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_login
    unless user_signed_in?
      flash[:alert] = 'You need to sign in or sign up before continuing.'
      redirect_to new_user_session_path
    end
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && @item.user_id == current_user.id
  end

  def sold_out
    redirect_to root_path if @item.stock == 0
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @item_order.token,
      currency: 'jpy'
    )
  end
end
