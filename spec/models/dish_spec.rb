require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  it 'can sum calories' do
    jordan = Chef.create(name: "Jordan Feldstein")
    yum = Dish.create(name: "PBJ", description: "peanut butter jelly time", chef_id: "#{jordan.id}")
    peanut_butter = yum.ingredients.create(name: "peanut butter", calories: 150)
    jelly = yum.ingredients.create(name: "raspberry jelly", calories: 80)
    bread = yum.ingredients.create(name: "bread", calories: 120)

    total = yum.calories

    expect(total).to eq(350)
  end
end
