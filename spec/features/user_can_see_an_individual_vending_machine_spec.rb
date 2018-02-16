require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario "they see the name of all the snacks along with price and average price" do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    dons.snacks.create!(name: "KitKat", price: 1.08)
    dons.snacks.create!(name: "Snickers", price: 1.14)

    visit machine_path(dons)

    expect(page).to have_content("KitKat: $1.08")
    expect(page).to have_content("Snickers: $1.14")
    expect(page).to have_content("Average Price: $1.11")
  end
end
