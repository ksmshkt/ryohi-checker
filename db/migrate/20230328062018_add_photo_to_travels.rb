class AddPhotoToTravels < ActiveRecord::Migration[7.0]
  def change
    add_column :travels, :photo, :string
  end
end
