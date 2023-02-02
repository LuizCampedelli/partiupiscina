class PagesController < ApplicationController
  def home
    @pools = Pool.all
  end
end
