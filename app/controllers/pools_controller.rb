class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index

    if params["search"].present?
      capacity = params["search"]["capacity"].present? ? params["search"]["capacity"] : 0
      size = params["search"]["size"].present? ? params["search"]["size"] : 0
      name = params["search"]["name"].present? ? "%" + params["search"]["name"] + "%" : nil
      address = params["search"]["address"].present? ? "%" + params["search"]["address"] + "%" : nil
      price = params["search"]["price"].present? ? params["search"]["price"].to_i * 100 : 0
      @pools = policy_scope(Pool).where("capacity= :capacity OR size= :size OR name ILIKE :name OR address ILIKE :address OR price= :price", capacity: capacity, size: size, name: name, address: address, price: price)
    else
      @pools = policy_scope(Pool)
    end
    
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
