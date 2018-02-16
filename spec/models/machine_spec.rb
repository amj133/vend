require 'rails_helper'

describe Machine, type: :model do
  describe "validations" do
    it { should validate_presence_of(:location) }
  end

  describe "relationships" do
    it { should belong_to(:owner) }
    it { is_expected.to have_many(:snacks).through(:snack_machines) }
  end
end
