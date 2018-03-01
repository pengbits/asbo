class AddDetailsFlagToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :has_details, :boolean
  end
end
