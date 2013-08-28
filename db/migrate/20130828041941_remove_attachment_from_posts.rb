class RemoveAttachmentFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :attachment
  end

  def down
    add_column :posts, :attachment, :text
  end
end
