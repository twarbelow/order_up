class ChefsController < ApplicationController
  def show
    @chef = Chef.find(params[:id])
  end

  def ingredients
    @ingredients = Chef.find(params[:id]).ingredients.uniq
  end
end
