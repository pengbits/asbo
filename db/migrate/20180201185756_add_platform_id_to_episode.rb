class AddPlatformIdToEpisode < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :platform_id, :integer
  end
end
