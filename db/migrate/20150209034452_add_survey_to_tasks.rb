class AddSurveyToTasks < ActiveRecord::Migration
  def change
    add_reference :tasks, :survey, index: true
  end
end
