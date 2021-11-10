class AddTagIdToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :tag_id, :integer
  end
end
