class AddUseRelativeImagePathsToPlatforms < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :use_relative_image_paths, :boolean
  end
end
