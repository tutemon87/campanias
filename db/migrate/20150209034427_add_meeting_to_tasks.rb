class AddMeetingToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :location, :string
    add_column :tasks, :date, :datetime
  end
end
