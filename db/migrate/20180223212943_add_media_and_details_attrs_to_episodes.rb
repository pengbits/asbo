class AddMediaAndDetailsAttrsToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :details, :string
    add_column :episodes, :media, :string
  end
end
