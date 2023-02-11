class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = policy_scope(Order)
  end

  def show
    @order = Order.find(params[:id])
    @pool = Pool.find(params[:pool_id])
    @price = @pool.price * (@order.enddate - @order.startdate).to_i
    authorize @order
  end

  def new
    @order = Order.new
    @pool = Pool.find(params[:pool_id])
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    @pool = Pool.find(params[:pool_id])
    @price = @pool.price * (@order.enddate - @order.startdate).to_i
    @order.price = @price
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

  def edit
    @order = Order.find(params[:id])
    @pool = @order.pool
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

    redirect_to pool_order_path(@order.pool)
    authorize @order
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    authorize @order
    redirect_to pool_path(@order.pool), notice: "Reservation Deleted"
  end

  private

  def order_params
    params.require(:order).permit(:startdate, :enddate)
  end
end
