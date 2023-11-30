class OrdersController < ApplicationController
  before_action :find_item

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      redirect_to item_orders_path(@item)
    else
      render :index
    end
  end

private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:zip_code, :prefecture_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
