require 'rails_helper'

describe DishIngredient, type: :model do
  describe "validations" do
    it { should validate_presence_of :dish_id }
    it { should validate_presence_of :ingredient_id }
  end

  describe "relationships" do
    it {should belong_to :dish}
    it {should belong_to :ingredient}
  end
end
