class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.date :started_on
      t.date :expired_on
      t.integer :targeted_to
      t.string :type
      t.integer :min
      t.integer :max
      t.timestamps
    end
  end
end
