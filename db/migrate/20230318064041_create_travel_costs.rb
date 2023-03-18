class CreateTravelCosts < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_costs do |t|
      t.references :travel, null: false, foreign_key: true
      t.string :name
      t.integer :budget
      t.integer :amount_paid

      t.timestamps
    end
  end
end
