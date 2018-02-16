class Snack < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  has_many :snack_machines
  has_many :machines, through: :snack_machines
end
