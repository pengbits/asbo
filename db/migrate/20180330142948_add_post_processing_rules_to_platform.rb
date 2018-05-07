class AddPostProcessingRulesToPlatform < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :post_processing_rules, :text
  end
end
