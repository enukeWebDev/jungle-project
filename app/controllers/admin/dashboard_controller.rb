class Admin::DashboardController < ApplicationController

  #  Implement HTTP basic auth as a way of securing the admin/products resource

  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]

  def show
    @total_counts_products = Product.count
    @total_counts_categories = Category.count
  end
end
