class AddSocialToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :action, :integer
  end
end
