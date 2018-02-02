class RemoveImgFromEpisodes < ActiveRecord::Migration[5.1]
  def change
    remove_column :episodes, :img
  end
end
