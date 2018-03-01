class AddDateProperToEpisode < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :date_proper, :datetime
  end
end
