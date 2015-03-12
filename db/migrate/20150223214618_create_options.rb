class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.text :content
      t.references :question, index: true

      t.timestamps
    end
  end
end
