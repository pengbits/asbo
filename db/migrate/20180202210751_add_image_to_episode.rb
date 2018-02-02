class AddImageToEpisode < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :image, :string
  end
end
