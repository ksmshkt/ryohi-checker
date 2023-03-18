class Travel < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: { maximum: 255 }
  has_many :travel_costs, dependent: :destroy
end
