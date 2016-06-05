class OrdersController < ApplicationController
  respond_to :html, :json , :js
  def new
    @order = Order.new
  end

  def update
    @order = Order.find params[:id]
    @order.update_attributes order_params
    respond_with @order
    #binding.pry
  end

  def create
    @order = current_user.orders.build(order_params)
    if
      @order.save
      flash[:success] = "Order created!"
      redirect_to :back
    else
      flash[:danger] = "some thing not true, please try again"
      redirect_to :back
    end

  end

  def index
    @pitches = current_user.pitches
  end

  private
  def order_params
    params.require(:order).permit(:time,:date_order,:child_pitch_id,:user_id,
      :shoes,:ball,:kit, :status, :phone )
  end
end
