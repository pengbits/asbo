class AddAttrMapToPlatforms < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :attr_map, :text
  end
end
