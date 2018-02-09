class AddDateFormatToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :date_format, :string
  end
end
