require 'rails_helper'

RSpec.describe 'dish show page' do
  it 'shows a list of ingredients and chef name for the dish' do
    jordan = Chef.create(name: "Jordan Feldstein")
    yum = Dish.create(name: "PBJ", description: "peanut butter jelly time", chef_id: "#{jordan.id}")
    peanut_butter = yum.ingredients.create(name: "peanut butter", calories: 150)
    jelly = yum.ingredients.create(name: "raspberry jelly", calories: 80)
    bread = yum.ingredients.create(name: "bread", calories: 120)

    visit "dish/#{yum.id}"

    expect(page).to have_content("Ingredients:")
    expect(page).to have_content("#{peanut_butter.name}")
    expect(page).to have_content("#{jelly.name}")
    expect(page).to have_content("#{bread.name}")
    expect(page).to have_content("Made by chef: #{jordan.name}")
  end
end
