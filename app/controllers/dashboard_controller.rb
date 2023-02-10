class DashboardController < ApplicationController

def show
  # lista de reservas de outras piscinas
  @orders = current_user.orders
  # lista das minhas piscinas
  @pools = current_user.pools
  # lista das reservas das minhas piscinas
  @pool_reservations = current_user.pools.map do |pool|
  pool.orders
  end
  skip_authorization
end

end
