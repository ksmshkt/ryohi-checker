class TravelCost < ApplicationRecord
  belongs_to :travel

  validates :name, presence: true, length: { maximum: 20 }
  validates :budget,
            presence: true,
            length: {
              maximum: 20,
            },
            numericality: {
              only_integer: true,
            }
  validates :amount_paid,
            presence: true,
            length: {
              maximum: 20,
            },
            numericality: {
              only_integer: true,
            }
end
