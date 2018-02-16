class Machine < ApplicationRecord
  belongs_to :owner

  validates :location, presence: true

  has_many :snack_machines
  has_many :snacks, through: :snack_machines
end
