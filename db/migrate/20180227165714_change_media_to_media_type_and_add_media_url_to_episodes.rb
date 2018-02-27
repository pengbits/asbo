class ChangeMediaToMediaTypeAndAddMediaUrlToEpisodes < ActiveRecord::Migration[5.1]
  def change
    remove_column :episodes, :media
       add_column :episodes, :media_type, :string
       add_column :episodes, :media_url, :string
  end
end
