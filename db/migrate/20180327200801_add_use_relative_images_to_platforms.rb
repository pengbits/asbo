class AddUseRelativeImagesToPlatforms < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :use_relative_images, :boolean
  end
end
