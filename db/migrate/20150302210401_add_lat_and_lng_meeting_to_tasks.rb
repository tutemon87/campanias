class AddLatAndLngMeetingToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :latitude, :decimal
    add_column :tasks, :longitude, :decimal
  end
end
