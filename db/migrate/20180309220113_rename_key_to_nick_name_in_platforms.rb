class RenameKeyToNickNameInPlatforms < ActiveRecord::Migration[5.1]
  def change
    remove_column :platforms, :key, :string
       add_column :platforms, :nickname, :string
  end
end
