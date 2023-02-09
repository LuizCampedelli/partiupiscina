class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @order = Order.find(params[:id])
    @pool = Pool.find(params[:pool_id])
    @price = @pool.price * (@order.enddate - @order.startdate).to_i
    authorize @order
  end

  def new
    @order = Order.new
    @pool = Pool.find_by(id: params[:id])
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @pool = Pool.find(params[:pool_id])
    @order.user = current_user
    @order.pool = @pool
    if @order.save
      redirect_to pool_order_path(@pool, @order)
    else
      render :new, status: :unprocessable_entity
    end
    @pool.user = current_user
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:startdate, :enddate)
  end
end
