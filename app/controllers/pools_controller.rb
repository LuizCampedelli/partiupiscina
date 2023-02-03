class PoolsController < ApplicationController
  def index
    @pools = Pool.all
  end

  def show
    @pool = Pool.find(params[:id])
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    if @pool.save
      redirect_to root_path
    else
      render :home
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
    params.require(:pool).permit(:name, :size, :price, :user_id, :pool_id)
  end

  def set_pool
    @pool = Pool.find(params[:id])
  end

end
