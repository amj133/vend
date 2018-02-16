require 'rails_helper'

describe Machine, type: :model do
  describe "validations" do
    it { should validate_presence_of(:location) }
  end

  describe "relationships" do
    it { should belong_to(:owner) }
    it { is_expected.to have_many(:snacks).through(:snack_machines) }
  end

  describe "instance methods" do
    it "#average_price returns average price of all snacks" do
      owner = Owner.create(name: "Sam's Snacks")
      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      dons.snacks.create!(name: "KitKat", price: 1.00)
      dons.snacks.create!(name: "Snickers", price: 2.00)

      expect(dons.average_price).to eq(1.50)
    end
  end
end
