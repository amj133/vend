class Owner < ApplicationRecord
  has_many :machines

  validates :name, presence: true
end
