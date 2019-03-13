class AddImageToShots < ActiveRecord::Migration[5.2]
  def change
    add_column :shots, :image, :string
  end
end
