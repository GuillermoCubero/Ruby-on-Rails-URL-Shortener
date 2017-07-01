class AddPictureToAdvertisements < ActiveRecord::Migration[5.0]
  def change
    add_column :advertisements, :picture, :string
  end
end
