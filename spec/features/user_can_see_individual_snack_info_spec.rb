require 'rails_helper'

describe "user can see individual snack info" do
  describe "user visits snack show page" do
    it "shows name and price of snack" do
      snack = Snack.create!(name: "kitkat", price: 1.15)

      visit snack_path(snack)

      expect(page).to have_content("kitkat")
      expect(page).to have_content("Price: $1.15")
    end

    it "shows list of vending machines locations and locations" do
      owner = Owner.create(name: "Sam's Snacks")
      snack = Snack.create!(name: "kitkat", price: 1.15)
      snack.machines.create!(location: "Don's", owner_id: owner.id)
      snack.machines.create!(location: "Bill's", owner_id: owner.id)

      visit snack_path(snack)

      expect(page).to have_content("Don's")
      expect(page).to have_content("Bill's")
    end

    it "shows average price for each vending machine" do
      owner = Owner.create(name: "Sam's Snacks")
      snack = Snack.create!(name: "kitkat", price: 1.15)
      snack.machines.create!(location: "Don's", owner_id: owner.id)

      visit snack_path(snack)

      expect(page).to have_content("average price of $1.15")
    end
  end
end
