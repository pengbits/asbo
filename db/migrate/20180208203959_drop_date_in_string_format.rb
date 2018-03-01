class DropDateInStringFormat < ActiveRecord::Migration[5.1]
  def change
    remove_column :episodes, :date_proper
    change_column :episodes, :date, :datetime
  end
end
