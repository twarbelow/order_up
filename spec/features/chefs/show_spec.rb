require 'rails_helper'

RSpec.describe 'chef show page' do
  it 'shows name of chef and a link to ingredients for that chef' do
    jordan = Chef.create(name: "Jordan Feldstein")
    yum = Dish.create(name: "PBJ", description: "peanut butter jelly time", chef_id: "#{jordan.id}")
    peanut_butter = yum.ingredients.create(name: "peanut butter", calories: 150)
    jelly = yum.ingredients.create(name: "raspberry jelly", calories: 80)
    bread = yum.ingredients.create(name: "bread", calories: 120)

    visit "chefs/#{jordan.id}"

    expect(page).to have_content("Name of Chef: #{jordan.name}")
    expect(page).to have_link("See Ingredients Used")

  end

  it 'goes to chefs ingredient index page and shows unique list of names of ingnredients for that chef' do
    jordan = Chef.create(name: "Jordan Feldstein")
    yum = Dish.create(name: "PBJ", description: "peanut butter jelly time", chef_id: "#{jordan.id}")
    peanut_butter = yum.ingredients.create(name: "peanut butter", calories: 150)
    jelly = yum.ingredients.create(name: "raspberry jelly", calories: 80)
    bread = yum.ingredients.create(name: "bread", calories: 120)
    yum_extra_nanners = Dish.create(name: "PBJ + Nanners", description: "peanut butter jelly time, but with nanners", chef_id: "#{jordan.id}")
    yum_extra_nanners.ingredients << peanut_butter
    yum_extra_nanners.ingredients << jelly
    yum_extra_nanners.ingredients << bread
    yum_extra_nanners.save
    nanners = yum_extra_nanners.ingredients.create(name: "nanners", calories: 40)

    visit "chefs/#{jordan.id}"

    click_on "See Ingredients Used"

    expect(page).to have_content("Ingredients Used By Chef #{jordan.name}:")
    expect(page).to have_content("#{peanut_butter.name}")
    expect(page).to have_content("#{jelly.name}")
    expect(page).to have_content("#{bread.name}")
    expect(page).to have_content("#{nanners.name}")
  end
end
