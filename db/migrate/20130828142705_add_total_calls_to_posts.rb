class AddTotalCallsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :total_calls, :integer
  end
end
