class ChangeDateToDateInsteadOfDateTimeInEpisodes < ActiveRecord::Migration[5.1]
  def change
    change_column :episodes, :date, :date
  end
end
