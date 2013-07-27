class AddActualTimeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :actual_time, :integer
  end
end
