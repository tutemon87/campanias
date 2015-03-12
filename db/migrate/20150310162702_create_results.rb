class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :type
      t.datetime :started_date
      t.datetime :ended_date
      t.text :comment
      t.decimal :latitude
      t.decimal :longitude
      t.references :task, index: true
      t.references :user, index: true
      t.references :survey, index:true
      t.timestamps
    end
  end
end