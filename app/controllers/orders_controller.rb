class OrdersController < ApplicationController
  before_action :find_item

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to item_orders_path(@item)
    else
      render :index, status: :unprocessable_entity
    end
  end

private

  def find_item
    @item = Item.find_by(id: params[:item_id])

    if @item.nil? || (user_signed_in? && @item.user_id == current_user.id)
      redirect_to root_path
    elsif !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def order_params
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
