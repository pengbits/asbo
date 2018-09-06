class AddLastPageToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :last_page, :integer
  end
end
