class AddUrlToEpisode < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :url, :string
  end
end
