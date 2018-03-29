class AddDefaultImageToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :default_image, :string
  end
end
