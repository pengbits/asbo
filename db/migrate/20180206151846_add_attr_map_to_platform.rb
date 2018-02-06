class AddAttrMapToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :attribute_map, :text
  end
end
