class Admin::CategoriesController < ApplicationController

  #  Implement HTTP basic auth as a way of securing the admin/products resource

  http_basic_authenticate_with name: ENV["USERNAME"], password: ENV["PASSWORD"]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: "New Category Created!"
   else
     render :new
   end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
  
end
