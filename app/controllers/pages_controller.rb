class PagesController < ApplicationController
  def home
    @pools = Pool.all
    @search = params["search"]
    return unless @search.present?

    @capacity = @search["capacity"]
    @pools = Pool.where(capacity: @capacity)
  end
end
