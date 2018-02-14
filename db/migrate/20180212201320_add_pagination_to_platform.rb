class AddPaginationToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :pagination, :text
  end
end
