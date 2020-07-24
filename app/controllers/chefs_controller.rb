class DishesController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end
end
