class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create]
  before_action :find_item

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

private

  def find_item
    @item = Item.find_by(id: params[:item_id])

    if @item.nil? || (@item.order.present? || (user_signed_in? && @item.user_id == current_user.id))
      redirect_to root_path
    elsif !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def order_params
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end