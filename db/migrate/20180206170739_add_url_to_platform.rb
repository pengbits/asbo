class AddUrlToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :url, :string
  end
end
