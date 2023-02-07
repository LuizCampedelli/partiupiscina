class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @pools = Pool.all
    @search = params["search"]
    return unless @search.present?

    @capacity = @search["capacity"]
    @pools = Pool.where(capacity: @capacity)
  end

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @pool = Pool.find(params[:id])
  end

  def update
    @pool = Pool.find(params[:id])
    @pool.update(pool_params)

    redirect_to pool_path(@pool)
  end

  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy
  end

  def search
    @pools = Pool.where("name ILIKE ?", "%#{params[:query]}%")
  end

  private

  def pool_params
    params.require(:pool).permit(:name, :size, :price, photos: [])
  end

  def set_pool
    @pool = Pool.find(params[:id])
  end

end
