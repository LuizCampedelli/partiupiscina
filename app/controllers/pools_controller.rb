class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index

    if params["search"].present?
      @pools = policy_scope(Pool).where(capacity: params["search"]["capacity"])
    else
      @pools = policy_scope(Pool)
    end
    @pools = Pool.all

    @markers = @pools.geocoded.map do |pool|
    {
      lat: pool.latitude,
      lng: pool.longitude
    }
    end
  end

  def show
    @order = Order.new
    @pool = Pool.find(params[:id])
    authorize @pool
  end

  def new
    @pool = Pool.new
    authorize @pool
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to root_path
    else
      render :new
    end
    authorize @pool
  end

  def edit
    @pool = Pool.find(params[:id])
    authorize @pool
  end

  def update
    @pool = Pool.find(params[:id])
    @pool.update(pool_params)

    redirect_to pool_path(@pool)
    authorize @pool
  end

  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy
    authorize @pool
  end

  private

  def pool_params
    params.require(:pool).permit(:name, :size, :address, :capacity, :price, photos: [])
  end

  def set_pool
    @pool = Pool.find(params[:id])
  end

end
