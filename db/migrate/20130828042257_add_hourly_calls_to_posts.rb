class AddHourlyCallsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hourly_calls, :integer
  end
end
