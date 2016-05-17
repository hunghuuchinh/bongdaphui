class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create

    @order = current_user.orders.build(order_params)
    if @order.save
      flash[:success] = "Order created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end

  end

  private
  def order_params
    params.require(:order).permit(:time,:date_order,:child_pitch_id,:user_id)
  end
end
