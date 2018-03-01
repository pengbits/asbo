class RemoveUrlFromEpisodes < ActiveRecord::Migration[5.1]
  def change
    remove_column :episodes, :url, :string
  end
end
