class Machine < ApplicationRecord
  belongs_to :owner

  validates :location, presence: true
end
