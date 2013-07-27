class AddTagToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :tag, :string
  end
end
